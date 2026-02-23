
# Reference

## ISA FairdomSEEK structure

The ISA format is widely used to represent research data. It is often used to represent MIAPPE data. FairdomSEEK uses the ISA structure, somewhat adapted.

 
### Assay and sample definition

In the ISA format, you can perform assays on samples. It assumes that in an experiment, there are several steps called a process. Each process has an input and an output and a protocol, that describes how the output was created from the input. The input can be either a material or data, and the output as well. These processes can be chained together. Here is an example:
    
    step 1 sample collection (input plant material-> output sample)
    step 2 DNA extraction and library prep (input sample -> output sample) 
    step 3 sequencing (input sample -> output data)
    step 4 analysis (input data -> output data)


In ISA these processes are organized the following way: the study contains 1 process with a material input (study source) to a material output (study sample). The other processes, however many needed, are grouped under the assay. The assay can consist of several steps/processes and starts with the study sample.

 
### ISA in FairdomSEEK

In FairdomSEEK, the processes that are grouped under the assay, are all called an assay even if the input and output are both a material object, or both data files. This does not fit with the classical meaning of the word ‘assay’, but it implements the same functionality as ISA. The assays can be connected into an assay stream. 


Each row, that can describe a sample, but also an assay performed on a sample, or a derivation of a data file, is called always a ‘sample’ in FairdomSEEK.

 
## MIAPPE and ENA in FairdomSEEK
[todo: write]

![](../img/ExampleFairdomSEEKschematic.png)

intro to data model

### Observation units and samples


Level where a measurement is done.

Whole greenhouse, per plot, plant, sample.



## Naming conventions
[todo: finish]

Study:
    
    <received study id> - <study name>
    example “CXRS4 - Drought response of arabidopsis after hormal treatment with PAMP”

Assay stream:

    <received study id> - <descriptive assay name>

Assay: 


## References inside sample templates
### Sample inputs

Unfortunately in FairdomSEEK the names of the samples are not used as identifiers. For this reason the column where you link to samples from the previous section (marked Input) needs to be formatted like this: 

    [{"id"=>343, "type"=>"Sample", "title"=>"yeast_wgs_02"}]


You can read more [here](https://docs.seek4science.org/help/user-guide/create-sample-isajson-compliant).

When you are entering this data, it might be convenient to make a column with the ids that the catalogue has generated, and one with the sample titles, and use excel formulas to create the required format, and copy the values into the upload sheet.

    ="[{""id""=>"&A1&", ""type""=>""Sample"", ""title""=>"""&B1&"""}]"

 
### Data files

To link a registered data file use the following format. 

    {"id"=>1, "type"=>"DataFile", "title"=>"File from data access layer"}

Find the data file ID, by going to the data file in the interface, and checking the number at the end of the URL https://catalogue.cropresilience.org/data_files/1 

 
## Defining assays

There is some flexibility in how to define assays. In FairdomSEEK, an assay (called assay stream) can be split into steps (called assays) that output material or a data file.

 
### Default strategy

1. Create one assay stream of each type of assay performed.
2. At the assay stream, choose the extended metadata type that fits the type of assay. 
3. Fill in all the information that is the same for each measurement in this extended metadata fields.
4. Create inside this assay stream a single assay of the type data file. 
5. Add fields for the parameters that are different per measurement.
6. Is the rows/samples of the assay to link the output files of the assay to the measured unit/plant/sample.

### At significant data processing

Create a next assay in the same assay stream. The protocol contains the performed data processing step. The output files can be explicitly linked to the input files.

 
### Top level sensors

Top level environmental measurements, with no distinction between rows/samples, can be grouped together in a single assay stream. This allows for linking the data files with the specs of the measurement/instrument, without a large part of the interface being taken up by sensor measurements, that are not relevant for the understanding the study. 

1. Create assay stream for these grouped measurements. Do not choose any extended metadata. 
2. Create an assay of the type observation with a material output. In this assay each row describes a type of measurement done. 
3. Create a next assay of the type data file. Each row links the output file to the described measurement.

 
### Multiple files per experiment

[rewrite]

If there are still different experimental conditions or if there are multiple data files per experiment: split into assay and data file separately. Add the different parameter on the assay, and link the files in the second data file assay

 
### Limitation

It is not possible to link derived data files to input files from multiple assay streams. There is no clear place to list key output artifacts, that summarize the conclusions of the study.


 
## Registering data files

You can register a URL that contains a file or a folder.

The advise is to register a folder that is both 

     easy to navigate inside, 
    containing for example only one data type and no different types of sub-folders

    the same permissions apply to the whole folder

An example would be: the all raw reads of a sequencing experiment.

The metadata is used to link certain experiments and samples to the files. Here you can indicate what file in the registered folder contains what data.

At a later stage, the permission set in SEEK will be applied to the data download. If you only register the whole study as a single data file, it is not possible to apply granular permissions on who can download your data.

 
## Grouping samples
[consider moving to top section explaining the model]
### Study source

Choose the granularity that is needed for your metadata. The sources are used to specify the biological material, as well as the growth conditions. At least each experimental block needs to be defined as a separate source. If the metadata and a sample needs to be traced back to a certain plant, you might define a source per plant.

 
### Study samples

The study samples section is used both for samples, as well as for defining observation units. 
Observation units are any level, where a measurement/observation is done. How to define this will depend on the specific design of a study, and typically be the unit for which each experiment generates a file. Think about the assays and the data files when defining the observation units.
