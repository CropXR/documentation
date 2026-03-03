# Glossary

This glossary defines key terms used throughout the CropXR documentation.

## Platforms and Services

| Term | Definition |
|------|------------|
| Resilience Hub | A platform providing all services offered by DataXR, including data storage, metadata catalogue, compute and pipelines. The term often refers to the future, more mature state of the infrastructure rather than the current state. |
| Research Drive | The current storage platform for research data within CropXR, hosted by SURF. See [Research Drive](../research-drive/index.md). |
| Catalogue | A searchable registry where researchers can find studies, models and pipelines within the consortium. The catalogue is built on FairdomSEEK. |
| FairdomSEEK | The open-source platform used for the CropXR metadata catalogue. It implements the ISA framework for organizing research data. See [SEEK Metadata Entry](../resilience-hub/seek/index.md). |
| SharePoint | A shared document repository for policies, procedures, and administrative information within CropXR. |
| DataXR | The data management team within CropXR responsible for data infrastructure, support, and tooling. |

## Metadata Standards

| Term | Definition |
|------|------------|
| ISA | Investigation-Study-Assay. A general-purpose framework for structuring experimental metadata. ISA organizes research into three hierarchical levels: Investigations (research themes), Studies (specific experiments), and Assays (measurements). See the [ISA specification](https://isa-specs.readthedocs.io/en/latest/index.html). |
| MIAPPE | Minimum Information About Plant Phenotyping Experiments. A metadata standard for plant phenotyping experiments. CropXR uses MIAPPE in combination with ISA for phenotyping studies. |
| ENA | European Nucleotide Archive. A repository and metadata standard for nucleotide sequencing data. CropXR uses ENA standards in combination with ISA for sequencing studies. |

## Data Structure Concepts

| Term | Definition |
|------|------------|
| Investigation | The top level of the ISA hierarchy. An investigation represents a broader research theme, typically encompassing the work of a PI or multiple researchers. An investigation contains one or more studies. |
| Study | A collection of related experiments that together address a research question, roughly equivalent in scope to a publication. A study contains assays and is part of an investigation. See [Defining a Study](../concepts/defining-a-study.md). |
| Assay | A measurement or analytical process performed on samples. In FairdomSEEK, multiple processing steps can be chained together in an assay stream. |
| Assay Stream | A sequence of connected assays in FairdomSEEK, representing a workflow from sample to data output. |
| Source | The starting biological material in a study, such as a plant variety under specific growth conditions. Sources are used to define experimental groups and conditions. |
| Sample | Material derived from a source, such as a tissue sample taken from a plant. Samples serve as inputs to assays. |
| Observation Unit | The entity on which measurements are performed. This can be at various levels: individual plant, plot, greenhouse, etc. The level determines the granularity of the associated data. |

## Documents and Procedures

| Term | Definition |
|------|------------|
| Consortium Agreement | The legal document governing collaboration, intellectual property, and data sharing within the CropXR consortium. |
| Data Access Policy | A document specifying data sharing policies for cases not covered by the consortium agreement. See [Data Sensitivity Levels](../policies/data-sensitivity-levels.md). |
| MMP | Metadata Management Procedure. The SharePoint documentation describing the process of study registration, data upload, and metadata management. |
| SOP | Standard Operating Procedure. A documented protocol describing how an experimental or analytical procedure is performed. SOPs can be linked to studies and assays in the catalogue. |

