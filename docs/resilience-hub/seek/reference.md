
# Catalogue Reference

## Naming conventions

Study:
    
    <study name>
    example “Drought response of arabidopsis after hormonal treatment with PAMP”

Assay stream:

    <descriptive assay name>

Assay: 


## References inside sample templates
### Sample inputs

In FairdomSEEK, the names of samples are not used as identifiers. So the **Input** column, which links each row to a row in the previous table, needs a special format that includes the id SEEK generated.

**Example** of a filled-in Input cell (your values will be different):

```
[{"id"=>343, "type"=>"Sample", "title"=>"yeast_wgs_02"}]
```

- `343` is the id SEEK generated for the row you are linking to.
- `yeast_wgs_02` is the name of that row.

You don't need to type these by hand. Use a formula to generate them, as described below. You can read more [here](https://docs.seek4science.org/help/user-guide/create-sample-isajson-compliant).

#### Which table to link to

| You are filling in… | The Input links to… |
|---|---|
| Samples table | Sources table |
| First assay of an assay stream | Samples table |
| Any later assay in the stream | The previous assay |

#### How to fill the Input column

SEEK only creates the ids when a table is uploaded. So you get them by downloading the **previous** table again after uploading it.

1. **Upload the previous table first.** For example, upload the Sources table before you fill in the Samples table.

2. **Download the previous table again.** Use **Export CSV** on that table. <!-- TODO: check whether there is another download option, and name the button here -->

    SEEK has now filled in the first two columns of this file. The first column holds the id.

3. **Add the formula in this downloaded file.** In the first empty column, in row 2, paste:

    ```
    ="[{""id""=>"&A2&", ""type""=>""Sample"", ""title""=>"""&B2&"""}]"
    ```

    - `A2` must point to the **id** column.
    - `B2` must point to the **name** column (for example *Source Name* or *subject_id*).

    Change the letters if your columns are in a different place.

4. **Fill the formula down.** Drag the formula down to the last row. Each row now shows a ready-made Input value.

5. **Copy those cells.**

6. **Paste the values into the table you are filling in.** Open the new template, click the right cell in the **Input** column, and paste with ++ctrl+shift+v++. This pastes the values, not the formula.

    !!! warning "Paste as values"
        A normal paste copies the formula. The formula refers to the other file, so it ends up empty, and SEEK reports `Input (...): ["is required"]`.

7. **Check each row links to the right input.** For example, make sure a sample's row gets the Input of the source it actually came from.

#### If the upload fails

The string is fragile, and a broken one is not reported as broken. If SEEK cannot parse the cell it treats it as empty and answers `Input (...): ["is required"]`, which points at the wrong problem. When you see that error, the cell almost always contains something rather than nothing.

Three things break it:

- **A missing quote after a key.** `"type"=>` is correct; `"type=>` parses as nothing. This is the easiest one to miss by eye.
- **Smart quotes.** Excel's autocorrect rewrites `"` as `“` and `”`, which SEEK cannot read. Turn the substitution off before pasting, and check the cell afterwards.
- **A pasted formula.** Copy the formula's result into the upload sheet with paste-as-values; the formula itself refers to cells in the other workbook and evaluates to nothing.

Writing the id as a quoted string (`"id"=>"343"`) is accepted, though the bare number above is the form to prefer.

The id is what SEEK resolves. The title is not checked against the record and does not have to match — a row with the wrong title still links correctly, and the interface displays the real name. Keep it accurate anyway: tooling that reads these workbooks parses the title back out of the string, so a wrong one is invisible in the catalogue but misleading later.

 
### Data files

To link a registered data file use the following format. 

    {"id"=>1, "type"=>"DataFile", "title"=>"File from data access layer"}

Note that this form has no square brackets, where a sample input does, and that the type is `DataFile` rather than `Sample`. The id is the data file's own id, not the id of any sample or assay row.

Find the data file ID, by going to the data file in the interface, and checking the number at the end of the URL https://catalogue.cropresilience.org/data_files/1 


## Defining assays

In FairdomSEEK, an assay (called assay stream) is split into steps (called assays). Each step outputs either material or a data file.

### Backbone of an assay stream

Every assay stream is built the same way, and the backbone is created before any metadata is entered:

1. Create one assay stream of each type of assay performed.
2. At the assay stream, choose the extended metadata type that fits the type of assay. 
3. Fill in all the information that is the same for each measurement in this extended metadata fields.
4. Create inside this assay stream a first assay of the ISA level “assay - material”. Each row describes one measurement, library or extract, with the measured unit/plant/sample as input.
5. Add fields for the parameters that are different per measurement.
6. Create a second assay of the ISA level “assay - data file”. Each row is one file and links it to the row of the first assay that produced it.

The order is fixed because the Input column of an assay links to the table before it in the stream: the first assay takes the study samples as input, the second takes the rows of the first. Several file rows can reference the same row of the first assay, so a measurement that produces more than one file, such as a paired-end library with two FASTQ files, is described once.

A data file assay cannot be the first assay of a stream: the data file templates hold no fields that describe the measurement. There is deliberately one way to build an assay stream. The combined templates named “… assay with data file” merged both tables into one; offering them as a second way added complexity and confused users, so they are being removed from the catalogue. Do not select one where a template list still offers it.

### At significant data processing

Create a next assay of the type data file in the same assay stream, after the assay that holds the raw data files. The protocol contains the performed data processing step. The output files can be explicitly linked to the input files.

 
### Top level sensors

Top level environmental measurements, with no distinction between rows/samples, can be grouped together in a single assay stream. This links the data files to the details of the measurement and instrument, without sensor measurements taking up a large part of the interface when they matter little for understanding the study. 

1. Create assay stream for these grouped measurements. Do not choose any extended metadata. 
2. Create an assay of the type observation with a material output. In this assay each row describes a type of measurement done. 
3. Create a next assay of the type data file. Each row links the output file to the described measurement.

 
### Limitation

It is not possible to link derived data files to input files from multiple assay streams. 
There is no clear place to list key output artifacts, that summarize the conclusions of the study.


 
## Registering data files

You can register a URL that contains a file or a folder.

The advice is to register a folder that is both:

- easy to navigate inside, containing for example only one data type and no different types of sub-folders
- the same permissions apply to the whole folder

An example would be: all the raw reads of a sequencing experiment.

The metadata is used to link certain experiments and samples to the files. Here you can indicate what file in the registered folder contains what data.

At a later stage, the permission set in SEEK will be applied to the data download. If you only register the whole study as a single data file, it is not possible to apply granular permissions on who can download your data.

 
## Grouping samples

### Study source

Choose the granularity that is needed for your metadata. The sources are used to specify the biological material, as well as the growth conditions. At least each experimental block needs to be defined as a separate source. If you need to trace a sample back to an individual plant, define one source per plant.

 
### Study samples

The study samples section is used both for samples, as well as for defining observation units. 
An observation unit is any level at which a measurement or observation is made. How you define them depends on the design of your study. Usually it is the unit for which an experiment produces a file. Think about the assays and the data files when defining the observation units.
