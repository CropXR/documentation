# Introduction

## Metadata

All the research produced in the CropXR consortium will be well annotated with metadata following the CropXR standards.

The metadata annotation will have multiple uses:

- Findability of your study, by other researchers in the consortium
- Reusability of your data by other users in the consortium
- Improvement of your own data annotation

The responsibility to annotate the data lies with the researcher, with the help and tools provided by DataXR.

CropXR uses established standards for metadata on plant research, combining elements from:

- **ISA** (Investigation-Study-Assay) framework for structuring research data
- **MIAPPE** (Minimum Information About Plant Phenotyping Experiments) for phenotyping studies
- **ENA** (European Nucleotide Archive) standards for sequencing data

### Model flexibility

A standardized metadata format ensures that the metadata has a predictable structure. There are however many different types of studies in the consortium, with different metadata that is important. To fit all different studies in the same format there is a certain flexibility in the model.

This puts some responsibility on the researcher for how to use this format and to really understand the model. These documents should provide the information needed to make those choices. For the first time entering metadata, plan sufficient time to understand the model.

If you are stuck at any point, things are unclear, or you need help, please reach out to the DataXR team at data@cropxr.org

### Catalogue
The metadata is from now on collected in the [Catalogue website](https://catalogue.cropresilience.org). In this catalogue people of the consortium can find studies, view and download the metadata, and view the associated data. Data producing researchers can manage who can view their study. 
Detailed instructions on how to fill in metadata can be found [here](../resilience-hub/seek/index.md).

For everyone who has already filled in metadata in the Excel templates, or is already in the process of filling in the metadata in the templates:
If the template is available to the DataXR team, the team will support the entry of your metadata into the catalogue. It is possible that you will be contacted with some questions about the metadata.


## Data

Data is stored in the Resilience Hub, together with the metadata in the catalogue. Each dataset is linked to an assay in the catalogue, so others can see what experiment the data comes from. Who can download a dataset follows the sharing settings of the study in the catalogue.

Data is uploaded and downloaded with the [command line tool](../resilience-hub/cli-tool/index.md):

- **Uploading:** enter your metadata in the catalogue first, then upload a folder of data to the matching assay.
- **Downloading:** find the dataset in the catalogue and use its identifier to download it.

!!! note "Research Drive"
    Data was previously stored on [Research Drive](../research-drive/index.md). It is no longer used for new studies, but existing data remains available there for now.
