# Maintenance audit — 30 October 2026

## Purpose and acceptance criteria

Provide dependable shared checks for downstream R package maintainers while
preserving existing workflow inputs and defaults. Configuration must have the
documented effect; malformed gates must fail explicitly; dependency failures
must remain visible. Run regression cases against the actual workflow steps.

Initial local baseline: `415630b22dd6acdc4dd03e514652eb28a9e07e31`.
The original checkout was clean. Changes are isolated on a maintenance branch.
The branch also incorporates upstream `7781930dce57f5d8ac05a7803fb42fe3b591d354`,
including newer action runtimes, private-term scanning and the declared-R-minimum
guard. The latter is exercised with missing, supported and unsupported minima.
The GitHub issue list and workflow-run list were empty when queried. Reusable
workflow presence is not evidence of a successful caller run.

## Findings and changes

| Finding | Evidence and impact | Severity | Resolution |
| --- | --- | --- | --- |
| Caller lint configuration ignored | `lint.yaml` copied `.lintr` but supplied `linters_with_defaults()` explicitly. Reproduced using a caller that disabled the default rules and one that added a custom rule. The shared 100-column setting was also ignored. | High | Run house rules, then run configured linters through lintr's normal configuration lookup. Regression cases exercise both paths and prove house rules remain mandatory. |
| Invalid coverage floor silently disabled enforcement | `test-coverage.yaml` changed `NA` to zero and accepted negative numbers. Real package coverage passed with `FLOOR=bad`, `NaN`, and `-1`. | High | Validate a finite floor in `[0,100]` before measuring coverage. |
| Empty coverage produced `NaN` and an incidental aggregation error | A source-only constants fixture reproduced the error. The log did not identify the missing measurable coverage. | Medium | Reject a nonfinite measurement with a direct diagnostic before writing the report. |
| Unsupported dependency-action input and redundant installer | `extra-repositories` is not an input of `setup-r-dependencies`. A second hard-coded Bioconductor installer ran after dependency resolution and caught errors; packages without Suggests also indexed a missing field. | Medium | Keep pak's complete dependency installation blocking, remove the unsupported input and duplicate installer, retain the legacy caller input. |
| Shared workflows had no own regression job | The baseline contains only reusable workflow triggers. | Medium | Add a self-check job and realistic disposable package fixtures. |
| Token permissions broader than required | Shared workflows used `read-all`. | Low | Limit to `contents: read`; existing uploads use their separate token. |

The baseline regression run failed ten scenarios, including distinct
configuration and input-validation cases. After repair, all 19 scenarios pass
on macOS ARM64 with R 4.6.1, lintr 3.4.0, covr 3.6.5, yaml 2.3.12 and xml2.
The coverage fixture measures 50%; floor zero passes and floor 100 fails.
This exercises actual package installation, tests and Cobertura generation.

## Roadmap and readiness

1. **Essential repairs:** correct gate behavior and dependency configuration;
   complete when regression scenarios and YAML validation pass.
2. **Dependable use:** document callable workflows, compatible inputs, pinning,
   and local verification; complete with executable examples and the self-check.
3. **External validation:** publish the reviewed branch only with authorization,
   run the hosted self-check, and test a real caller with Bioconductor and X11
   requirements across the advertised matrix. This remains unverified locally.
4. **Deferred:** decide a repository-wide software licence with the maintainer;
   audit organisation-profile readiness labels as each downstream repository is
   assessed. Existing status labels and font provenance are preserved.

No package was submitted, workflow deployed, or release published by this
maintenance pass. The first-use and validation commands are in `README.md`.

## Authoritative interfaces checked

- [setup-r-dependencies inputs](https://github.com/r-lib/actions/blob/v2/setup-r-dependencies/action.yaml)
- [setup-r repository configuration](https://github.com/r-lib/actions/blob/v2/setup-r/action.yml)
- [pak package sources](https://pak.r-lib.org/reference/pak_package_sources.html)
- [lintr configuration](https://lintr.r-lib.org/reference/read_settings.html)
- [covr coverage percentage](https://covr.r-lib.org/reference/percent_coverage.html)
