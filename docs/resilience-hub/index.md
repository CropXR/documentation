# Resilience Hub

The Resilience Hub is the CropXR platform for sharing research data within the consortium. It has two parts:

- **The catalogue** (FairdomSEEK), where you describe your study with metadata and other researchers find it
- **Data storage**, where the data files themselves are kept, uploaded and downloaded with the command line tool `rhub`

Every dataset is linked to an assay in the catalogue, so the data always comes with a description of the experiment that produced it.

## How it works

1. **Register your study** in the [intake form](https://forms.cloud.microsoft/Pages/ResponsePage.aspx?id=TVJuCSlpMECM04q0LeCIe9rk7LtjOclKu9pKlmXMf-xUMzVUVFpYVkxZTE9VNTFXTVBMSU1EN1paTC4u) and receive a study ID
2. [**Enter your metadata**](./seek/) in the catalogue: the study, its assays and samples
3. [**Upload your data**](./cli-tool/) to the matching assay with the command line tool
4. Your work package lead approves the upload
5. Others can download the dataset, according to the sharing settings of your study

## In this section

- **[Before you upload](seek/upload-prerequisites.md)**: accounts, project membership and permissions you need first
- **[SEEK metadata entry](seek/index.md)**: how to describe your study in the catalogue, with short and full guides and a worked example
- **[Command line tool](cli-tool/index.md)**: [installing `rhub`](cli-tool/cli-install.md), [uploading a dataset](cli-tool/cli-upload.md), [downloading a dataset](cli-tool/cli-download.md) and [common errors](cli-tool/cli-common-errors.md)

!!! question "Need help?"
    Mail the DataXR team at data@cropxr.org.
