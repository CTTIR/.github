# Run the actual workflow R steps against disposable caller packages.
# Prerequisites: yaml, lintr, covr, xml2. No credentials or network required.
root <- normalizePath(".", winslash = "/")
for (pkg in c("yaml", "lintr", "covr", "xml2")) {
  if (!requireNamespace(pkg, quietly = TRUE)) stop("Install ", pkg, " first")
}
scratch <- tempfile("cttir-workflows-")
dir.create(scratch)
logs <- Sys.getenv("CTTIR_TEST_LOG_DIR", file.path(scratch, "logs"))
dir.create(logs, recursive = TRUE, showWarnings = FALSE)
failures <- character()

step_code <- function(workflow, job, step_name) {
  doc <- yaml::read_yaml(file.path(root, ".github/workflows", workflow))
  steps <- Filter(function(s) identical(s$name, step_name), doc$jobs[[job]]$steps)
  stopifnot(length(steps) == 1L)
  steps[[1L]]$run
}
lint_code <- step_code("lint.yaml", "lint", "Lint")
coverage_code <- step_code("test-coverage.yaml", "test-coverage", "Measure coverage")
rmin_code <- step_code("R-CMD-check.yaml", "R-CMD-check", "Compare R with the declared minimum")

fixture <- function(name, code = "value <- function(x) x\n") {
  path <- file.path(scratch, name)
  dir.create(file.path(path, "R"), recursive = TRUE)
  writeLines(c(
    "Package: workflowfixture", "Version: 0.0.1",
    "Title: Disposable Workflow Fixture",
    "Description: Synthetic package for shared workflow regression tests.",
    "Authors@R: person('Fixture', 'Maintainer', email='fixture@example.org', role=c('aut','cre'))",
    "License: GPL-3", "Encoding: UTF-8"
  ), file.path(path, "DESCRIPTION"))
  writeLines("exportPattern(\"^[[:alpha:]]+\")", file.path(path, "NAMESPACE"))
  writeLines(code, file.path(path, "R", "fixture.R"))
  dir.create(file.path(path, ".cttir-shared"))
  stopifnot(file.copy(file.path(root, "config"), file.path(path, ".cttir-shared"),
                     recursive = TRUE))
  path
}

run_step <- function(label, path, code, vars = list(), success = TRUE,
                     contains = NULL, absent = NULL) {
  script <- file.path(scratch, paste0(label, ".R"))
  env_code <- if (length(vars)) paste0("Sys.setenv(", paste(
    paste0(names(vars), "=", vapply(vars, function(x) encodeString(x, quote='"'), "")),
    collapse=","), ")") else character()
  writeLines(c(paste0("setwd(", encodeString(path, quote='"'), ")"), env_code, code), script)
  output <- suppressWarnings(system2(file.path(R.home("bin"), "Rscript"),
    c("--vanilla", shQuote(script)), stdout = TRUE, stderr = TRUE))
  status <- attr(output, "status")
  if (is.null(status)) status <- 0L
  writeLines(c(paste("EXIT", status), output), file.path(logs, paste0(label, ".log")))
  ok <- identical(status == 0L, success)
  if (!is.null(contains)) ok <- ok && any(grepl(contains, output, fixed = TRUE))
  if (!is.null(absent)) ok <- ok && !any(grepl(absent, output, fixed = TRUE))
  if (!ok) failures <<- c(failures, label)
  cat(if (ok) "PASS" else "FAIL", label, "(exit", status, ")\n")
  if (!ok) cat(paste(output, collapse = "\n"), "\n")
  invisible(output)
}

p <- fixture("caller-config", "MixedCase <- function(x) x")
writeLines("linters: list()", file.path(p, ".lintr"))
run_step("caller-config-respected", p, lint_code,
  list(WITH_DEFAULTS="true", BLOCKING="true", VOCAB_ONLY="true"),
  contains="No lint findings")
stopifnot(identical(readLines(file.path(p, ".lintr")), "linters: list()"))

p <- fixture("caller-r-config", "MixedCase <- function(x) x")
writeLines("linters <- list()", file.path(p, ".lintr.R"))
run_step("caller-r-config-respected", p, lint_code,
  list(WITH_DEFAULTS="true", BLOCKING="true", VOCAB_ONLY="true"),
  contains="No lint findings")
stopifnot(!file.exists(file.path(p, ".lintr")))

p <- fixture("caller-rule", "value <- function(x) x + 1")
writeLines('linters: list(object_name_linter = object_name_linter(regex = "^expected$"))',
           file.path(p, ".lintr"))
run_step("caller-custom-rule-runs", p, lint_code,
  list(WITH_DEFAULTS="true", BLOCKING="true", VOCAB_ONLY="true"),
  success=FALSE, contains="object_name_linter")

p <- fixture("shared-config", paste0("# ", paste(rep("a", 85), collapse=""), "\nvalue <- 1"))
run_step("shared-100-column-limit", p, lint_code,
  list(WITH_DEFAULTS="true", BLOCKING="true", VOCAB_ONLY="true"),
  contains="No lint findings")

p <- fixture("house", "p_value <- 0.1; ci_low <- 0; ci_high <- 1")
run_step("house-blocking", p, lint_code,
  list(WITH_DEFAULTS="false", BLOCKING="true", VOCAB_ONLY="true"),
  success=FALSE, contains="3 lint findings")
run_step("house-report-only", p, lint_code,
  list(WITH_DEFAULTS="false", BLOCKING="false", VOCAB_ONLY="true"),
  contains="3 lint findings")
writeLines("linters: list()", file.path(p, ".lintr"))
run_step("caller-cannot-disable-house", p, lint_code,
  list(WITH_DEFAULTS="true", BLOCKING="true", VOCAB_ONLY="true"),
  success=FALSE, contains="3 lint findings")

p <- fixture("coverage", c("identity_value <- function(x) {", "  x", "}",
                           "unused_value <- function(x) {", "  x + 1", "}"))
dir.create(file.path(p, "tests"))
writeLines(c("library(workflowfixture)", "stopifnot(identity_value(3) == 3)"),
           file.path(p, "tests", "check.R"))
run_step("coverage-disabled-floor", p, coverage_code, list(FLOOR="0"),
         contains="B_tests =")
stopifnot(file.exists(file.path(p, "cobertura.xml")))
run_step("coverage-enforced-floor", p, coverage_code, list(FLOOR="100"),
         success=FALSE, contains="below the floor")
run_step("coverage-met-floor", p, coverage_code, list(FLOOR="50"),
         contains="B_tests = 50.00%")
for (bad in c("-1", "101", "NaN", "Inf", "bad")) {
  run_step(paste0("invalid-floor-", bad), p, coverage_code, list(FLOOR=bad),
           success=FALSE, contains="finite number between 0 and 100")
}

p <- fixture("no-coverage", "answer <- 42")
run_step("no-measurable-coverage", p, coverage_code, list(FLOOR="50"),
         success=FALSE, contains="No measurable test coverage")

for (minimum in c("", "R (>= 3.6.0)", "R (>= 99.0.0)")) {
  label <- if (!nzchar(minimum)) "missing" else if (grepl("99", minimum)) "newer" else "supported"
  p <- fixture(paste0("rmin-", label))
  if (nzchar(minimum)) cat(paste0("Depends: ", minimum, "\n"),
                           file=file.path(p, "DESCRIPTION"), append=TRUE)
  output_file <- file.path(p, "github-output")
  run_step(paste0("r-minimum-", label), p, rmin_code,
           list(GITHUB_OUTPUT=output_file))
  stopifnot(identical(readLines(output_file),
                     paste0("supported=", if (label == "newer") "false" else "true")))
}

if (length(failures)) {
  stop("Workflow regression failures: ", paste(failures, collapse=", "),
       ". Logs: ", logs)
}
cat("All shared workflow regressions passed.\n")
if (nzchar(Sys.getenv("CTTIR_TEST_LOG_DIR"))) cat("Logs:", logs, "\n")
unlink(scratch, recursive=TRUE)
