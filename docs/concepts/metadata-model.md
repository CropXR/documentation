# Introduction Metadata Model

All the research produced in the CropXR consortium will be well annotated with metadata following the CropXR standards. 

The metadata annotation will have multiple uses:

- Findability of your study, by other researchers in the consortium
- Reusability of your data by other users in the consortium
- Improvement of your own data annotation

The responsibility to annotate the data lies with the researcher, with the help and tools provided by DataXR.


#### Model flexibility
A standardized metadata format ensures that the metadata has a predictable structure. 
There are however many different types of studies in the consortium, with different metadata that is important. 
To fit all different studies in the same format there is a certain flexibility in the model.
This puts some responsibility on the researcher for how to use this format and to really understand the model. 
These documents should provide the information needed to make those choices. 
For the first time entering metadata, plan sufficient time to understand the model.
If you are stuck at any point, things are unclear, or you need help, please reach out to the DataXR team at data@cropxr.org


## Standards

The CropXR metadata model is made up from a combination of established standards for metadata on plant research:

- **Phenotyping** [ISA](https://isa-specs.readthedocs.io/en/latest/index.html) + [MIAPPE](link with MIAPPE fields)
- **Sequencing** [ISA](https://isa-specs.readthedocs.io/en/latest/index.html) + [ENA for plants](ENA35) + [ENA for crops](ENA37) + additional fields based on LettuceKnow experience.

MIAPPE and ENA describe in a standardized way, the setup of a study, the experimental conditions, 
the types of measurements performed and how the output data can be related to that, up to sample level.
This detailed standardized description facilitates that the findability and reusability of the data.

There is a lot of overlap between the phenotyping and sequencing metadata: 
they both provide general information about the goal of the study, the plant material, the growth conditions and the treatment.
This information has been combined where possible to create a unified metadata model.

You describe the plants and conditions, and from there start multiple types of measurements.
It will also be possible to describe the lineage of derived data files.

The ISA format is widely used to represent research data. It is often used to represent MIAPPE data. 
The catalogue uses the ISA structure, somewhat adapted. This page will explain how the standards fit into the catalogue data model.



### Assay and sample definition

In the ISA format, you can perform assays on samples. It assumes that in an experiment, there are several steps called a process. Each process has an input and an output and a protocol, that describes how the output was created from the input. The input can be either a material or data, and the output as well. These processes can be chained together. Here is an example:
    
    step 1 sample collection (input plant material-> output sample)
    step 2 DNA extraction and library prep (input sample -> output sample) 
    step 3 sequencing (input sample -> output data)
    step 4 analysis (input data -> output data)


In ISA these processes are organized the following way: the study contains 1 process with a material input (study source) to a material output (study sample). The other processes, however many needed, are grouped under the assay. The assay can consist of several steps/processes and starts with the study sample.

In the catalogue, the processes that are grouped under the assay, are all called an assay even if the input and output are both a material object, or both data files. This does not fit with the classical meaning of the word ‘assay’, but it implements the same functionality as ISA. The assays can be connected into an assay stream.

Each row, that can describe a sample, but also an assay performed on a sample, or a derivation of a data file, is called always a ‘sample’ in the catalogue.

 
## MIAPPE and ENA in the catalogue model


![](../docs/img/SEEKSchematicCombinedStudy.png)


## Sections

### Study extended metadata

Information that is the same for the whole study

### Study sources

Plants, general conditions, conditions varied per experimetnal group. Lots of info
The sample section describes the plant, the growth conditions, the treatment

There are a lot of standard things asked.
It is possible to include any type of parameter to describe the growth conditions.
Find them in the appendix for a predictable description of a condition. 
Not all conditions are as relevant and need to be included in the metadata.

Choose the granularity that is needed for your metadata. The sources are used to specify the biological material, as well as the growth conditions. At least each experimental block needs to be defined as a separate source. If the metadata and a sample needs to be traced back to a certain plant, you might define a source per plant.


### Study samples
Level where a measurement is done.
Sample or obs unit.
Whole greenhouse, per plot, plant, sample.

The study samples section is used both for samples, as well as for defining observation units. 
Observation units are any level, where a measurement/observation is done. How to define this will depend on the specific design of a study, and typically be the unit for which each experiment generates a file. Think about the assays and the data files when defining the observation units.



The observation unit is the unit of measurement. It can be a plant, a plot, or a whole field.
sample just an id and info about sampling.

Can be nested, but make a flat list.
Does not contain a lot of info.

### Phenotyping assay extended metadata

For each pheno - all info that is the same
The observed variable describes the measurement: what was measured and how, including the instrument. 


The phenotyping template allows you to describe any type of measurement. 
This is important, because phenotyping does not rely on a limited set of experiments.
It does require you to describe the measurement in the format.
As more people have started with their metadata annotation, it is likely valuable to create a CropXR internal reference,
where you can find how other people have described similar or the same type of experiments.


### Assay rows
Include any info that is different per 
The data file section is used to link the output to the measurement and the conditions.



### Phenotyping general assay

It is possible to make a general assay that includes multiple measurement types.

### Derived data files
It will also be possible to describe the lineage of derived data files.


## Practical

#### Relevant columns
Not all fields are relevant to each study.

#### Fixed or free fields
Some fields are free text, some you need to pick from a list (controlled vocabulary), some are free, but with a list of suggestions to pick from.


## Outlook
In the future the catalogue will be extended to cover metabolomics data.

The catalogue can be improved with small suggestions based on researcher feedback.

There will be an improved integration with the storage.

There will be a way to export the metadata into an ENA format for easy submission. There will be an importer that can import published ENA metadata into the format of the catalogue. 
