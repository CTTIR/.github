<div align="center">

<img src="https://avatars.githubusercontent.com/u/275040041?s=200&v=4" width="120" alt="CTTIR logo" />

# Computational Trauma and Tissue Injury Research

**Reproducible computational tools, analyses, and teaching resources for trauma and tissue injury research.**

[Website](https://cttir.github.io/website/) · [Tutorials](https://github.com/CTTIR/tutorials) · [Courses](https://github.com/CTTIR/courses) · [Resources](https://github.com/CTTIR/ressources)

</div>

---

## About

CTTIR develops open-source software, reproducible analysis pipelines, and educational materials at the interface of trauma surgery, tissue injury, and computational biomedicine. Our work spans biomarker discovery, multi-modal imaging, dimensionality reduction, molecular pathology, and clinical-translational data science.

---

## R Packages

> Statistical and analytical R packages developed and maintained by CTTIR, grouped by theme.
>
> **Status** &nbsp; ●●● published &nbsp;·&nbsp; ●●○ usable &nbsp;·&nbsp; ●○○ draft &nbsp;·&nbsp; ○○○ idea
>
> **DOI** &nbsp; ⧗ reserved — pending publication (does not resolve yet)

### Imaging & Microscopy

| Package | Status | DOI | Description |
|---|:---:|:---:|---|
| [**annotatR**](https://github.com/CTTIR/annotatR) | ●●○ | [![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.21889921.svg)](https://doi.org/10.5281/zenodo.21889921) ⧗ | Multi-layer region-of-interest annotation for whole-slide microscopy, hyperspectral cubes, and rasters — exports binary, labelled, and multi-class masks (GeoJSON, QuPath, TIFF) with a resumable Shiny/OpenSeadragon batch annotator |
| [**cellreportR**](https://github.com/CTTIR/cellreportR) | ●●○ | [![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.21889928.svg)](https://doi.org/10.5281/zenodo.21889928) ⧗ | Statistical analysis and audit-ready reporting pipeline for routine cell-culture diagnostics with microscopic evaluation |
| [**phenoscapR**](https://github.com/CTTIR/phenoscapR) | ●●○ | [![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.21889952.svg)](https://doi.org/10.5281/zenodo.21889952) ⧗ | Reading, QC, phenotyping, spatial statistics, and visualisation of single-cell spatial biology data from multiplexed imaging |
| [**scimagR**](https://github.com/CTTIR/scimagR) | ●●○ | [![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.21889958.svg)](https://doi.org/10.5281/zenodo.21889958) ⧗ | End-to-end pipeline for longitudinal MRI/CT analysis in spinal-cord injury research (wraps Spinal Cord Toolbox, dcm2niix) |
| [**segmantR**](https://github.com/CTTIR/segmantR) | ●●○ | [![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.21889962.svg)](https://doi.org/10.5281/zenodo.21889962) ⧗ | Cell segmentation for histology and multiplexed tissue imaging with human-in-the-loop training (classical + Cellpose/StarDist/Mesmer) |

### Spectral & Hyperspectral

| Package | Status | DOI | Description |
|---|:---:|:---:|---|
| [**cuvis.r**](https://github.com/CTTIR/cuvis.r) | ●●○ | [![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.21889930.svg)](https://doi.org/10.5281/zenodo.21889930) | R bindings to the Cubert CUVIS SDK for reading, calibrating, and exporting hyperspectral camera data |
| [**hyperspectaculR**](https://github.com/CTTIR/hyperspectaculR) | ●●○ | [![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.21889974.svg)](https://doi.org/10.5281/zenodo.21889974) | Publication-grade artistic visualisation of hyperspectral imagery, built on the `hyperspectR` cube class |
| [**hyperspectR**](https://github.com/CTTIR/hyperspectR) | ●●○ | [![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.21889940.svg)](https://doi.org/10.5281/zenodo.21889940) | Complete pipeline for biomedical hyperspectral imaging — from raw camera data to clinical tissue oxygenation maps |
| [**libscanR**](https://github.com/CTTIR/libscanR) | ●●○ | [![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.21889942.svg)](https://doi.org/10.5281/zenodo.21889942) ⧗ | Vendor-agnostic analysis and visualisation of Laser-Induced Breakdown Spectroscopy (LIBS) data, with a biomedical-tissue focus |
| [**tivis.r**](https://github.com/CTTIR/tivis.r) | ●●○ | [![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.21889970.svg)](https://doi.org/10.5281/zenodo.21889970) | Pure-R reader for Diaspective Vision TIVITA recordings — no vendor SDK required; companion to `cuvis.r` |

### Omics & Transcriptomics

| Package | Status | DOI | Description |
|---|:---:|:---:|---|
| [**bambamR**](https://github.com/CTTIR/bambamR) | ●●○ | [![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.21889924.svg)](https://doi.org/10.5281/zenodo.21889924) ⧗ | Streamlined RNA-seq analysis pipelines — from count matrices to publication-ready results |

### Clinical & Molecular Pathology

| Package | Status | DOI | Description |
|---|:---:|:---:|---|
| [**molpathR**](https://github.com/CTTIR/molpathR) | ●●○ | [![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.21889946.svg)](https://doi.org/10.5281/zenodo.21889946) ⧗ | Unified molecular-pathology platform — parses NGS files (VCF, BAM, FASTQ) plus XML/PDF reports and clinical data |
| [**zhncommandR**](https://github.com/CTTIR/zhncommandR) | ●●○ | -na- | Auditor live-evaluation dashboard for haematological oncology cohorts — quality/coverage indicators, OPS-coded complex-therapy and diagnostics counts, Kaplan–Meier, oncoprint, and cytogenetics summaries in an interactive Shiny app |

### Parsers & Data I/O

| Package | Status | DOI | Description |
|---|:---:|:---:|---|
| [**harbouR**](https://github.com/CTTIR/harbouR) | ●●○ | [![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.21889936.svg)](https://doi.org/10.5281/zenodo.21889936) ⧗ | Unofficial R client for the SeaTable REST API — read, write, and sync collaborative cloud databases from R |
| [**lstparsR**](https://github.com/Clinical-Pharmacy-Saarland-University/lstparsR) | ●●○ | -na- | Parser for NONMEM `.lst` output files — extracts THETA / OMEGA / SIGMA estimates into tidy data frames for population PK/PD analysis |
| [**pressR**](https://github.com/CTTIR/pressR) | ●●○ | [![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.21889954.svg)](https://doi.org/10.5281/zenodo.21889954) ⧗ | Parsing, analysis, and visualisation of capacitive pressure-distribution data (insoles, saddles, seating, pedography) |
| [**qviewparsR**](https://github.com/CTTIR/qviewparsR) | ●●● | [![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.21395352.svg)](https://doi.org/10.5281/zenodo.21395352) | Pure-R parser for the binary `.Q-View` project format used in chemiluminescent multiplex ELISA plate imaging |

### Methods & Analytics

| Package | Status | DOI | Description |
|---|:---:|:---:|---|
| [**dynasimR**](https://github.com/CTTIR/dynasimR) | ●●○ | [![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.21889932.svg)](https://doi.org/10.5281/zenodo.21889932) ⧗ | Domain-neutral analysis and visualisation layer for discrete-event, agent-based, and node-actor simulation outputs |
| [**scimapR**](https://github.com/CTTIR/scimapR) | ●●○ | [![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.21889960.svg)](https://doi.org/10.5281/zenodo.21889960) ⧗ | Reproducible, question-driven, embedding-aware science mapping — bibliometric and scientometric analysis toolkit |
| [**songR**](https://github.com/CTTIR/songR) | ●●○ | [![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.21889964.svg)](https://doi.org/10.5281/zenodo.21889964) ⧗ | Native R/C++ implementation of SONG (Self-Organizing Nebulous Growths) for nonlinear dimensionality reduction |

### Reproducibility & Tooling

| Package | Status | DOI | Description |
|---|:---:|:---:|---|
| [**hexmakR**](https://github.com/CTTIR/hexmakR) | ●●○ | [![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.21889938.svg)](https://doi.org/10.5281/zenodo.21889938) ⧗ | Generate polished hex sticker logos for R packages using customizable templates |
| [**reflowR**](https://github.com/CTTIR/reflowR) | ●●○ | [![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.21889956.svg)](https://doi.org/10.5281/zenodo.21889956) ⧗ | Custom workflowr themes and templates for reproducible research websites in R |
| [**themakR**](https://github.com/CTTIR/themakR) | ●●○ | [![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.21889968.svg)](https://doi.org/10.5281/zenodo.21889968) ⧗ | Shared pkgdown template giving the CTTIR package suite a unified look — Hugo Coder palette with a light/dark toggle |

Install any package with:

```r
# install.packages("remotes")
remotes::install_github("CTTIR/<package>")
```

---

## Applications

> Standalone apps and tools that complement the R package suite.
>
> **Status** &nbsp; ●●● published &nbsp;·&nbsp; ●●○ usable &nbsp;·&nbsp; ●○○ draft &nbsp;·&nbsp; ○○○ idea

| Application | Status | DOI | Description |
|---|:---:|:---:|---|
| [**pwa-quest**](https://github.com/CTTIR/pwa-quest) | ●●○ | -na- | Offline-first Progressive Web App for collecting questionnaire responses in research and field settings — exports sessions as QR codes or CSV / XLSX / TXT / XML |
| [**shinylaunchR**](https://github.com/CTTIR/shinylaunchR) | ●●○ | [![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.21889984.svg)](https://doi.org/10.5281/zenodo.21889984) ⧗ | Cross-platform desktop launchpad for R/Shiny apps — opens packaged apps, Shiny files, or hosted URLs each in its own native window while R runs headless |

---

## Zotero Plugins

> Plugins that extend Zotero for curated, reproducible reference management.
>
> **Status** &nbsp; ●●● published &nbsp;·&nbsp; ●●○ usable &nbsp;·&nbsp; ●○○ draft &nbsp;·&nbsp; ○○○ idea

| Plugin | Status | DOI | Description |
|---|:---:|:---:|---|
| [**argus-one**](https://github.com/CTTIR/argus-one) | ●●○ | [![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.21889976.svg)](https://doi.org/10.5281/zenodo.21889976) ⧗ | Merges duplicate Zotero items by DOI only — keeps the newest record's fields, unions collections, tags, and attachments inside one transaction |
| [**attaclone-dedup**](https://github.com/CTTIR/attaclone-dedup) | ●●○ | [![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.21889978.svg)](https://doi.org/10.5281/zenodo.21889978) ⧗ | Detects and resolves duplicate file attachments by content hash — auto-removes byte-identical bare copies, prompts a review dialog for annotated PDFs |
| [**metadata-mender**](https://github.com/CTTIR/metadata-mender) | ●●○ | [![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.21889980.svg)](https://doi.org/10.5281/zenodo.21889980) ⧗ | Reconciles and completes item metadata against PubMed, OpenAlex, Crossref, Semantic Scholar, OpenAIRE, Unpaywall, CORE, and CRAN |

Install by downloading the `.xpi` from the corresponding repository's Releases page, then **Tools → Plugins → ⚙ → Install Plugin From File…** in Zotero.

---

## Tutorials & Courses

| Repository | Description |
|---|---|
| [**courses**](https://github.com/CTTIR/courses) | Course materials taught by the group |
| [**tutorials**](https://github.com/CTTIR/tutorials) | Hands-on tutorials accompanying our packages and methods |

---

## Resources

| Repository | Description |
|---|---|
| [**ressources**](https://github.com/CTTIR/ressources) | Shared assets, references, and supporting material used across CTTIR projects |

---

## Web Presence

- **Organisation website**: [cttir.github.io/website](https://cttir.github.io/website/) — source at [CTTIR/website](https://github.com/CTTIR/website)

---

## Contributing & Citation

Most repositories carry an MIT license and a `CITATION.cff` file. Please cite the specific package or repository you use — see each repo's `README.md` for the canonical citation.

For questions, contributions, or collaboration enquiries, open an issue on the relevant repository.

---

<div align="center">
<sub>Maintained by the CTTIR group · <a href="https://github.com/CTTIR">github.com/CTTIR</a></sub>
</div>
