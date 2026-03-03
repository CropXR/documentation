# Introduction Metadata Model

## Standards  [to write]

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
Well separated into sections.
Overwheling at first, many references needed, but in the end less duplicated info. 
All samples from the same plant can refer to it, rather than copying the info for each row.

Any type of measurement, but you have to describe it

Add any important parameter (env, etc), you need to think which ones to include

### Sections
[include diagram]

things that are true for whole study
- location
- environment
- events

defined experimental conditions

define obs units: whatever you want for measuring + apply conditions

link output


## Sequencing template
Quite condensed, lot of data duplication / mixed responsibilities , but less sections.

Fixed fields that prompt you, but a lot of unnesessary fields to skip

### Sections
[include diagram]

sample also describes most of the conditions

experiments = experiment on a sample


## Outlook  [to write]

In the future catalogue, these will be combined, so the information about the experiment and treatment is captured once.
You describe the plants and conditions, and from there start multiple types of measurements.

What will stay:
- same info can be filled, slightly differently organized
- optional to define for whole study (phen) or per subunit
- same concepts like defining observation units
- still thinking what is important to you

Different organization for the same fields. 
Combination of web interface + excel templates.


## Practical [to write]
Excel templates (for now)

Inv and study id you get, the rest you make up.
Make sure that everything you reference exists.

Not all columns are relevant to each study.


### Combined study  [to refine]
For now, there is a separate metadata template for phenotyping and sequencing studies.
Choose the template that allows you to describe the general information and experimental conditions.
That includes the following sheets:

- Phenotyping: Investigation, Study, Person, Biological material, Environment, Event, Experimental factor
- Sequencing: Investigation, Study, Sample

The for the remaining sections, use both sheets to properly capture the experiments. 
Make sure to use the same IDs or make references to the IDs used in the other template, so plants/samples can be linked.


