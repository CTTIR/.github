<div align="center">

<img src="https://avatars.githubusercontent.com/u/275040041?s=200&v=4" width="120" alt="CTIR logo" />

# Computational Trauma and Tissue Injury Research

**Reproducible computational tools, analyses, and teaching resources for trauma and tissue injury research.**

[Website](https://github.com/CTTIR/website) · [Tutorials](https://github.com/CTTIR/tutorials) · [Courses](https://github.com/CTTIR/courses) · [Resources](https://github.com/CTTIR/ressources)

</div>

---

## About

CTIR develops open-source software, reproducible analysis pipelines, and educational materials at the interface of trauma surgery, tissue injury, and computational biomedicine. Our work spans biomarker discovery, multi-modal imaging, dimensionality reduction, molecular pathology, and clinical-translational data science.

---

## R Packages

> Statistical and analytical R packages developed and maintained by CTIR.

| Package | Description |
|---|---|
| [**bambamR**](https://github.com/CTTIR/bambamR) | Streamlined RNA-seq analysis pipelines — from count matrices to publication-ready results |
| [**bamflowR**](https://github.com/CTTIR/bamflowR) | End-to-end RNA-seq and DNA-seq pipeline (STAR, BWA-MEM2, GATK, featureCounts, fastp) with a Shiny front-end |
| [**cellreportR**](https://github.com/CTTIR/cellreportR) | Statistical analysis and audit-ready reporting pipeline for routine cell-culture diagnostics with microscopic evaluation |
| [**cuvis.r**](https://github.com/CTTIR/cuvis.r) | R bindings to the Cubert CUVIS SDK for reading, calibrating, and exporting hyperspectral camera data |
| [**dynasimR**](https://github.com/CTTIR/dynasimR) | Domain-neutral analysis and visualisation layer for discrete-event, agent-based, and node-actor simulation outputs |
| [**hexmakR**](https://github.com/CTTIR/hexmakR) | Generate polished hex sticker logos for R packages using customizable templates |
| [**hyperspectR**](https://github.com/CTTIR/hyperspectR) | Complete pipeline for biomedical hyperspectral imaging — from raw camera data to clinical tissue oxygenation maps |
| [**libscanR**](https://github.com/CTTIR/libscanR) | Vendor-agnostic analysis and visualisation of Laser-Induced Breakdown Spectroscopy (LIBS) data, with a biomedical-tissue focus |
| [**lstparsR**](https://github.com/CTTIR/lstparsR) | Parser for NONMEM `.lst` output files — extracts THETA / OMEGA / SIGMA estimates into tidy data frames for population PK/PD analysis |
| [**molpathR**](https://github.com/CTTIR/molpathR) | Unified molecular-pathology platform — parses NGS files (VCF, BAM, FASTQ) plus XML/PDF reports and clinical data |
| [**phenoscapR**](https://github.com/CTTIR/phenoscapR) | Reading, QC, phenotyping, spatial statistics, and visualisation of single-cell spatial biology data from multiplexed imaging |
| [**pressR**](https://github.com/CTTIR/pressR) | Parsing, analysis, and visualisation of capacitive pressure-distribution data (insoles, saddles, seating, pedography) |
| [**qviewparsR**](https://github.com/CTTIR/qviewparsR) | Pure-R parser for the binary `.Q-View` project format used in chemiluminescent multiplex ELISA plate imaging |
| [**reflowR**](https://github.com/CTTIR/reflowR) | Custom workflowr themes and templates for reproducible research websites in R |
| [**scimagR**](https://github.com/CTTIR/scimagR) | End-to-end pipeline for longitudinal MRI/CT analysis in spinal-cord injury research (wraps Spinal Cord Toolbox, dcm2niix) |
| [**segmantR**](https://github.com/CTTIR/segmantR) | Cell segmentation for histology and multiplexed tissue imaging with human-in-the-loop training (classical + Cellpose/StarDist/Mesmer) |
| [**songR**](https://github.com/CTTIR/songR) | Native R/C++ implementation of SONG (Self-Organizing Nebulous Growths) for nonlinear dimensionality reduction |

Install any package with:

```r
# install.packages("remotes")
remotes::install_github("CTTIR/<package>")
```

---

## Zotero Plugins

> Plugins that extend Zotero for curated, reproducible reference management.

| Plugin | Description |
|---|---|
| [**argus-one**](https://github.com/CTTIR/argus-one) | Merges duplicate Zotero items by DOI only — keeps the newest record's fields, unions collections, tags, and attachments inside one transaction |
| [**attaclone-dedup**](https://github.com/CTTIR/attaclone-dedup) | Detects and resolves duplicate file attachments by content hash — auto-removes byte-identical bare copies, prompts a review dialog for annotated PDFs |
| [**metadata-mender**](https://github.com/CTTIR/metadata-mender) | Reconciles and completes item metadata against PubMed, OpenAlex, Crossref, Semantic Scholar, OpenAIRE, Unpaywall, CORE, and CRAN |

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
| [**ressources**](https://github.com/CTTIR/ressources) | Shared assets, references, and supporting material used across CTIR projects |

---

## Web Presence

- **Organisation website source**: [CTTIR/website](https://github.com/CTTIR/website)

---

## Contributing & Citation

Most repositories carry an MIT license and a `CITATION.cff` file. Please cite the specific package or repository you use — see each repo's `README.md` for the canonical citation.

For questions, contributions, or collaboration enquiries, open an issue on the relevant repository.

---

<div align="center">
<sub>Maintained by the CTIR group · <a href="https://github.com/CTTIR">github.com/CTTIR</a></sub>
</div>
