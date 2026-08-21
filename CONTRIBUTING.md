# Contributing to CTTIR

CTTIR maintains ~22 R packages plus apps and teaching material. This file is
inherited by every repository in the organisation that does not override it.

## House style

Copy [`qviewparsR`](https://github.com/CTTIR/qviewparsR). It is the reference
implementation: exact-value fixtures, a cross-check against vendor exports, and
the Shiny app in `R/` where `covr`, `lintr` and `R CMD check` can all see it.

- **Naming** — packages end in `R`; functions carry the package's short prefix.
- **Statistics columns** use broom's spelling: `p.value`, `estimate`,
  `std.error`, `conf.low`, `conf.high`. Not `p_value`, not `ci_low`.
- **Identifiers** (`subject_id`, `sample_id`, `image_id`, `cell_id`) are always
  character, always a column — never a rowname, never buried in a metadata list.
- **Units** live in the vocabulary, not the column name: `wavelength` is nm.
- **Errors** use `cli::cli_abort()` with a condition class, not `stop()`.
- **Shiny code lives in `R/`**, not `inst/`. Code in `inst/` is invisible to
  `R CMD check`, `lintr` and `covr` — 9,885 lines across the estate are
  currently unmeasurable for this reason.

The house linters in [`config/lint-cttir.R`](config/lint-cttir.R) encode the
naming rules. They run report-only until a repository's count reaches zero.

## Shared workflows

Do not copy workflow YAML between repositories. Call the shared ones:

```yaml
jobs:
  check:
    uses: CTTIR/.github/.github/workflows/R-CMD-check.yaml@main
```

Available: `R-CMD-check.yaml`, `test-coverage.yaml`, `lint.yaml`.

## Frozen packages

**`harbouR`, `cellreportR` and `pressR` underpin manuscripts written or in
press.** They accept behaviour-preserving changes only. Each carries an
`api-lock` job pinning its exported signatures, S3 methods and declared
dependencies. If that job fails, the correct response is almost always to
revert the change — not to accept the snapshot. Accepting one is a decision to
change what a published analysis referred to.

Adding a new export is the one additive change that is fine.

## Automation

Scripted changes across repositories may **create files or replace whole
files**. They may not edit structured fields in place.

This rule exists because a sweep on 2026-08-11 matched `doi = "..."` by field
name across `inst/CITATION` and edited every match, landing on third-party
`Article` entries in `songR` and `scimapR` and attributing CTTIR DOIs to other
people's peer-reviewed papers. It went unnoticed for ten days. Identify the
edit target by ownership, not by pattern, and make sure some invariant can
disagree with the edit.
