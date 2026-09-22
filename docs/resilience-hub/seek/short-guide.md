
# Short guide

Detailed instructions are found [here](full-guide.md)

!!! warning "Always select the highest ID"
    Every template list below shows all released versions under the same name. Select the
    entry with the highest ID; that is the latest version.

Prepare

1. register the study in the form and get storage 
2. gather relevant documents, such as lab notes and experimental design overviews

Start with the metadata entry in FairdomSEEK

3. create a study
      1. choose an extended metadata type
      2. set the sharing of the study
      3. choose a template for the study source. Add additional fields if needed.
      4. choose a template for the study sample, matching your stream: “CropXR sequencing sample”,
         “CropXR phenotyping observation unit”, “CropXR metabolomics sample”, or “CropXR combined
         sample” when the study holds both samples and measurements on another level
4. for each assay type create an assay stream
      1. select the right extended metadata
      2. set the sharing
5. within the assay stream create one or more assays 
      1. choose the assay template matching your stream and ISA level: “assay - material” for the
         experiment itself (“CropXR sequencing assay”, “CropXR phenotyping assay”, “CropXR
         metabolomics assay”), “assay - data file” for the files it produces (“CropXR sequencing
         data file”, “CropXR phenotyping data file”, “CropXR metabolomics data file”)
      2. add additional fields if needed
      3. add additional assays for data files that were generate from the first assay output

Now the study has been defined, continue with the minimally needed metadata.

Sources, samples and assay rows are all entered the same way — download, fill, upload. The order
is fixed: first the “Sources table”, then the “Samples table” (both under “Study design”), then
each assay’s own table. Finish one table before opening the next.

For each table in turn:

- open it and click “Batch download to Excel”
- fill the data in the **Samples** sheet of the workbook, leaving the first two columns (`id` and
  `uuid`) empty — SEEK fills those, and they are how you read the ids back later
- save the file, then under “Upload excel spreadsheet” click “Browse” and “🟦Upload”. Read any
  error message carefully and correct the sheet

Download a table only after the previous one has been uploaded. SEEK identifies rows by catalogue
id, not by name, so the Input column linking a table to the one before it can only be filled once
those rows exist and have ids. See the [format for sample inputs](reference.md#sample-inputs).

Uploading a row whose name already exists creates a second row rather than updating the first.
To revise rows that are already there, select them before downloading.

6. Register protocols under SOPs and manage the permissions.
7. Edit the study to fill the extend metadata and link SOPs.
8. Define sources, based on your specific study and the level of granularity needed.

    Enter the data with the download, fill, upload cycle above.

9. Define samples, based on your specific study and the level of granularity needed.

    Enter the data with the same cycle, referencing the study sources by name and id in the Input column.

10. Edit assay metadata
11. Enter assay row data with the same cycle. Leave the file location column empty: it takes a
    reference to a data file already registered in SEEK, not a path, so the file must exist as a
    record first. That happens in the next step.

The metadata now stands on its own. The second step is to add the data.

!!! note "This step will change"
    Adding data will move to the data access layer. Until it does, you register the location of
    your data yourself, as described below.

12. Register your data files. SEEK stores a link to the data, not a copy: the files stay where
    they are on the Research Drive.
      1. under “➕Create” choose “Data file”, and under the “Remote URL” tab paste the URL of a
         file or folder on the Research Drive
      2. register one folder per set of files that hold a single data type and share the same
         permissions — assay rows point at the individual files inside it by relative path
      3. set the sharing. These permissions will govern who can download the data, so registering
         a whole study as one data file leaves no way to grant access to part of it
13. Link each registered data file into the assay rows it belongs to, using the [format for data
    files](reference.md#data-files). Select the rows before downloading, so the upload revises
    them instead of adding a second set.

Now that the minimal metadata is added, continue improving the metadata.

14. adapt permissions
15. update with additional data
