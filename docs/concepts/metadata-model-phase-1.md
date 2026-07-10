
# Phase 1 excel templates

In the first phase of the CropXR program Excel templates have been used to collect metadata.

Only read this section if you need to understand the older Excel templates. For new metadata entry enter the data in the catalogue.

There were two separate templates for phenotyping and sequencing experiments.
The templates were more close to the original metadata standards and therefor the are differences between the templates:
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

