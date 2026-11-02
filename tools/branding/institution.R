# Render the CTTIR institution logo: the ribbon square and the CTTIR wordmark.
#
#   Rscript tools/branding/institution.R /path/to/review
#   Rscript tools/branding/institution.R --apply   # assets/branding/institution
run_institution <- function(branding) {
  params <- commandArgs(trailingOnly = TRUE)
  if (length(params) != 1L || is.na(params) || !nzchar(params)) {
    stop("Supply an output directory or --apply.")
  }
  if (!capabilities("cairo")) stop("Cairo graphics are required.")
  output <- if (identical(params, "--apply")) {
    file.path(dirname(dirname(branding)), "assets", "branding", "institution")
  } else params
  dir.create(output, recursive = TRUE, showWarnings = FALSE)

  font <- cttir_token("type", "brand_font")
  H <- 6; W <- H * 3.6
  # SVG is the vector master; Cairo PDFs embed run-dependent font subsets.
  vector <- function(stem, w, h, draw) {
    grDevices::svg(file.path(output, paste0(stem, ".svg")), width = w, height = h,
      bg = "transparent", family = font); draw(); grDevices::dev.off()
  }
  raster <- function(file, px, w, h, draw) {
    grDevices::png(file.path(output, file), width = px, height = round(px * h / w),
      res = px / w, bg = "transparent", type = "cairo", antialias = "gray")
    draw(); grDevices::dev.off()
  }
  mark <- function(s, small = FALSE, opaque = FALSE) function() {
    grid::grid.newpage(); cttir_institution_mark(s, small, opaque)
  }

  for (mode in c("light", "dark", "mono")) {
    s <- cttir_institution_style(mode)
    suffix <- if (mode == "light") "" else paste0("-", mode)
    logo <- function() cttir_institution_logo(s, W, H)
    vector(paste0("logo", suffix), W, H, logo)
    raster(paste0("logo", suffix, ".png"), 2400L, W, H, logo)
    vector(paste0("mark", suffix), H, H, mark(s))
    raster(paste0("mark", suffix, ".png"), 1200L, H, H, mark(s))
  }
  # Icons use the dark mark, like the package icons. Small sizes drop the
  # hairline; the touch icon and avatar are opaque because their hosts
  # fill transparent corners with black.
  s <- cttir_institution_style("dark")
  grDevices::svg(file.path(output, "favicon.svg"), width = H, height = H,
    bg = "transparent", family = font); mark(s, small = TRUE)(); grDevices::dev.off()
  for (px in c(16L, 32L, 48L, 64L, 192L, 512L)) {
    raster(sprintf("icon-%d.png", px), px, H, H, mark(s, small = px <= 64))
  }
  raster("apple-touch-icon.png", 180L, H, H, mark(s, opaque = TRUE))
  raster("github-avatar.png", 512L, H, H, mark(s, opaque = TRUE))
  message("Rendered the CTTIR institution logo into ", output)
}
# The supplied renderer discovers its relative sources from a top-level source call.
script_files <- sub("^--file=", "", commandArgs(trailingOnly = FALSE)[
  grepl("^--file=", commandArgs(trailingOnly = FALSE))
])
if (length(script_files) != 1L) stop("Run this file with Rscript.")
branding_dir <- dirname(normalizePath(script_files, mustWork = TRUE))
source(file.path(branding_dir, "R", "cttir_hex.R"))
source(file.path(branding_dir, "R", "institution.R"))
rm(script_files)
run_institution(branding_dir)
