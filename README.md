# Shared CTTIR repository infrastructure

This repository supplies the organisation profile, contribution and security
guidance, house linters, and reusable R package workflows. It is not an R
package and has no application server to deploy.

## Use in an R package

Create `.github/workflows/check.yaml` in a repository containing a valid
`DESCRIPTION`, source code, and tests:

```yaml
name: Package checks
on: [push, pull_request]
permissions:
  contents: read
jobs:
  check:
    uses: CTTIR/.github/.github/workflows/R-CMD-check.yaml@main
  lint:
    uses: CTTIR/.github/.github/workflows/lint.yaml@main
    with:
      blocking: true
      with-defaults: true
  coverage:
    uses: CTTIR/.github/.github/workflows/test-coverage.yaml@main
    with:
      floor: 80
```

Choose a coverage floor based on verified package behavior. Zero disables the
numeric threshold but still requires a measurable result. Negative, nonfinite,
or above-100 values fail. Coverage measures tests, not example reachability.
`CODECOV_TOKEN` is optional; without it the measured coverage is still checked
locally in the workflow, but no upload is attempted.

Lint defaults remain report-only and house-rules-only. With `with-defaults:
true`, repository `.lintr`/`.lintr.R` settings are honored in addition to the
house rules. If neither file exists, the shared 100-column configuration is
used. Caller configuration cannot disable the house rules. For an immutable
workflow pin, replace `@main` with a reviewed commit and also pass that commit
as lint's `config-ref` input.

Dependency installation uses pak and includes declared Suggests. Installation
errors are blocking. The old `bioc-repository` input remains accepted for caller
compatibility; pak already resolves Bioconductor dependencies for the runner's
R version. There is no second installer with a hard-coded package list. Enable
`macos-xquartz: true` for packages that require X11 on macOS.

## Validate changes locally

Prerequisites: R, the packages below, and optionally `actionlint` on PATH.
The regression fixtures are synthetic and are created in a temporary directory.
No GitHub token, user dataset, or running application is required.

```sh
Rscript --vanilla -e 'install.packages(c("yaml", "lintr", "covr", "xml2"), repos="https://cloud.r-project.org")'
Rscript --vanilla tests/test-workflows.R
actionlint -shellcheck= -pyflakes=
git diff --check
```

The regression runner extracts and executes the actual R steps from the
workflow YAML. It checks caller settings, house-rule enforcement, thresholds,
and missing coverage. `self-check.yaml` runs these checks on changes to this
repository. The optional `CTTIR_TEST_LOG_DIR` environment variable preserves
per-scenario logs at the specified location.

The local tests do not run the hosted macOS/Windows/Linux matrix or validate
external service credentials. Review those results on a caller package before
promoting a new shared workflow revision across the organisation.

See [maintenance evidence and roadmap](docs/maintenance-2026-10-30.md) for the
current audit and outstanding decisions. Font licences remain alongside their
assets; no repository-wide software licence has been inferred.
