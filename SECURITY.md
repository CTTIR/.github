# Security and data protection

## Reporting

Open a private security advisory on the affected repository, or contact the
maintainer directly. Please do not open a public issue for anything involving
credentials or patient data.

## Research data

Several repositories process clinical or human-subjects data. Before adding
data to any repository:

- **Never commit identifiable data**, including in filenames. A filename
  carrying a participant's name, initials or body measurements is identifiable
  data regardless of the file's contents.
- Raw media and instrument output belong in an access-controlled store, not in
  git. Git keeps everything you ever committed.
- Pseudonymisation must break the linkage. Note that
  `scimagR::anonymize_dicom()` does **not** meet DICOM PS3.15 Basic Application
  Level Confidentiality: it leaves the Study/Series/SOP UID chain, dates, age,
  sex and accession number intact, so its output remains re-linkable to the
  source PACS. Do not use it to prepare data for sharing.
- Deployments that expose cohort data need authentication. The
  `zhncommandR` docker recipe publishes an unauthenticated dashboard over TLS
  and must not be pointed at real data as shipped.
