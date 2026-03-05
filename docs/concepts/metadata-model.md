# Introduction Metadata Model

[WIP, will be refined]

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

These two models describe in a standardized way, the setup of a study, the experimental conditions, 
the types of measurements performed and how the output data can be related to that, up to sample level.
This detailed standardized description facilitates that the findability and reusability of the data.

There is a lot of overlap between the phenotyping and sequencing metadata: 
they both provide general information about the goal of the study, the plant material, the growth conditions and the treatment.

For much of this overlapping information, it is not evident from the template, 
because the templates are as close to the original standard as possible, and are organised in a different way.

The main differences between the templates are:

- The phenotyping template has the same information split into more different separate sections than the sequencing template
- The phenotyping template has a more free structure than sequencing


## Phenotyping template

#### Split sections
The phenotyping template is separated into a high number of sections (sheets).  
It might be overwhelming to understand what each sections contains. 
There are many references between the sections needed. 
But the separation also reduces duplicated data. 
For example, for several samples from the same plant, 
you can refer to the plant defined in a different section at the samples, rather than copying the info for each row.

#### Open format
The phenotyping template allows you to describe any type of measurement. 
This is important, because phenotyping does not rely on a limited set of experiments.
It does require you to describe the measurement in the format.
As more people have started with their metadata annotation, it is likely valuable to create a CropXR internal reference,
where you can find how other people have described similar or the same type of experiments.

It is also possible to include any type of parameter to describe the growth conditions.
Find them in the appendix for a predictable description of a condition. 
Not all conditions are as relevant and need to be included in the metadata.

### Sections
[include diagram]

The overview sheet also contains a description of each section.

There are several sections that describe properties of the whole study, every plant in it.

- Everything in the study section, including the location
- The environment section
- Events

The experimental factor section describes all conditions that are varied between different experimental groups.

The observation unit is the unit of measurement. It can be a plant, a plot, or a whole field.
You are free to define these as you need, and therefor need to think while defining them.
It is also used to describe what experimental factor was applied to that plant.

The observed variable describes the measurement: what was measured and how, including the instrument. 

The data file section is used to link the output to the measurement and the conditions.

## Sequencing template

#### Combined sections
The sequencing template has few sections. 
These sections contain more fields, and describe multiple concepts.
There is a duplication of data between the rows.

#### Closed format
The template contains many fields, especially in the sample sections. 
These fields have been selected because they were considered relevant. 
If they are not relevant to your study you can leave them empty.

### Sections
[include diagram]

The sample section describes the plant, the growth conditions, the treatment and the sampling.
The experiment section describes assays performed on a sample.


## Practical
Each study gets one filled in metadata template (with the exception of combined studies, which get two).

#### IDs
At registration you receive an investigation id and study id from CropXR. These should be used in the template.

In other sections of the sheets there are ids needed. You need to provide these yourself. They need to be unique within the study so they can be referenced.
If you in one section refer to an id, make sure it is defined.
For example, in the data file section you link a sample to the data file, you need to make sure that that sample id was defined in the sample section.

#### Relevant columns
Not all columns are relevant to each study.

#### Fixed or free fields
Each field contains a description of the type. There are a few special cases explained below:
-	field format: ‘free text, see appendix’ + appendix type: ‘example’ -> not fixed, but useful examples can be found in the appendix.
    If you have useful fields that we can add to make the lives of others more easy, you can suggest additional examples for us to add.
-	field format: ‘ + appendix type: ‘pre-defined list’ -> you need to choose one of the values from the appendix. 
    If you really think you need a value that is not here, you can contact DataXR and we can discuss, but this is not very likely.
-	field format: ‘ontology with examples’ -> find a relevant term in the listed ontologies. 
    If there is no term for your situation, and you think we should define a term for CropXR you can again contact us. Many fields offer a free text field next to the ontology field. The ontology is an unambiguous way to describe the field value. If no predefined description fits, I think a free text entry should be sufficient.

The appendices contain lists. 
The appendices are not to be filled, they are a reference and help to fill the fields of the main section.


#### Combined study
For now, there is a separate metadata template for phenotyping and sequencing studies.
Choose the template that allows you to describe the general information and experimental conditions.
That includes the following sheets:

- Phenotyping: Investigation, Study, Person, Biological material, Environment, Event, Experimental factor
- Sequencing: Investigation, Study, Sample

The for the remaining sections, use both sheets to properly capture the experiments. 
Make sure to use the same IDs or make references to the IDs used in the other template, so plants/samples can be linked.


## Outlook: catalogue

The metadata is currently collected in Excel templates. 
The metadata that is collected in these templates, will be imported into a catalogue. 
In this catalogue people of the consortium can find studies, view and download the metadata en view the associated data. 
In the catalogue, the data producing researchers will also be able to manage who can view their study. 
It will be made available to you as soon as possible.

[insert screenshot of catalogue with example studies]

In the future catalogue, the phenotyping and sequencing templates will be combined, 
so the information about the experiment and treatment is captured once.
You describe the plants and conditions, and from there start multiple types of measurements.
It will also be possible to describe the lineage of derived data files.

What will stay:
- the same information can be captured, somewhat differently organized
- the same concepts and decisions are needed, like the definition of observation units
- there is still decisions required from the researcher how to best capture what is important to your study
- sequencing many suggested fields (additional fields can still be added as needed)

All data filled in the current metadata templates will be ingested into the catalogue. No effort by the users will be lost.

