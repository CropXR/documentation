# General Workflow

## Preparations

1. Understand the basic structure of the [metadata model](../concepts/metadata-model.md).
2. Decide [what experiments to group into the study](../concepts/defining-a-study.md).
3. Choose the study type (sequencing, phenotyping or combined). Inform DataXR well up front when your study does not fit these types.
4. Make sure that you have registered your study in this [form](https://forms.cloud.microsoft/Pages/ResponsePage.aspx?id=TVJuCSlpMECM04q0LeCIe9rk7LtjOclKu9pKlmXMf-xUMzVUVFpYVkxZTE9VNTFXTVBMSU1EN1paTC4u). After the admin has checked the registration, you will receive a study id you need when entering the metadata.
5. Gather the files with the metadata that you already collected. This includes e-lab journal entries, files that outline experimental conditions per plant, files that link output files to the experiment, etc.
6. Make a plan of [what data should be uploaded](../concepts/what-data-to-upload.md) and how it should be organised into datasets. Each dataset is uploaded as one folder and belongs to one assay.


## Minimal metadata entry
Decide how to group conditions and samples, so that all the information you need is captured. In the [catalogue](../resilience-hub/seek/index.md), fill in all the fields that are essential to understand the study, focusing on key aspects, such as species and assay type. Make sure every assay you want to upload data to exists, so others can find and understand your data.


## Data upload

Your metadata has to be in the catalogue before you can upload, because each dataset is uploaded to an assay.

Pre-requisites:

- [Install the command line tool](../resilience-hub/cli-tool/cli-install.md) `rhub` and sign in. You do this once.
- Check that you have [access to the assay](../resilience-hub/seek/upload-prerequisites.md) you are uploading to, and know its assay id.

Steps:

1. Put everything that belongs to a dataset into one folder.
2. [Upload the folder](../resilience-hub/cli-tool/cli-upload.md) to the matching assay with `rhub upload`.
3. Your work package lead approves the upload, after which the dataset appears in the catalogue.

!!! warning "Research Drive"
    Uploads to Research Drive are no longer possible for new studies.


## Improving metadata
At any point in time you can save the metadata and edit it later. Add any additional metadata you collected; this makes your data easier to reuse.


## Other things

### Adding columns
You can add columns for relevant metadata that the provided columns do not cover.
Before you do, please ask an expert to check that the information is not already covered by an existing column.

### Combined study
For instructions on the metadata of a combined study, read [here](../concepts/metadata-model.md#assay-and-sample-definition).

### Ontology lookup
Ontology terms make metadata much clearer, but finding the right term across different ontologies
can be difficult and time consuming.
We are still working on improving the workflow for researchers and are open to suggestions.

If the suggested sources for ontologies do not cover the exact conditions, and you think a specific term could be useful throughout the consortium,
please contact us. It is likely that there will be a list of CropXR specific terms, that can be referenced.

