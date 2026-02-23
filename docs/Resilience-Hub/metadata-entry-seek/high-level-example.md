# High level example


## Experimental design

2 varieties (col-0, ler) and 2 watering regimes (well watered, drought) -> 4 experimental groups.
Measurements:
- RNA-seq of root and and leaf samples
- Canopy coverage per experimental group
- Some general measurements from the greenhouse.

## Study general

Choose combined sequencing and phenotyping study. Add SOP with experimental design map for MIAPPE.

## Study source 

Create one source per experimental group. Specify the variety and watering regime. Add additional information that is relevant.

## Study samples

Create samples of type ‘sample’ for each root sample taken. The input is the source of the experimental group that the plant was grown in. Specify the plant structure/anatomical entity as root. 

Create samples for the leave samples in the same way.

Create samples of type ‘observation_unit’ for each experimental group. The level is ‘plot’. The input is the source of that experimental group.

Create a sample of type ‘observation_unit’ that combine all sources. The level is ‘greenhouse’. 

 
## Assays

Create one phenotyping assay stream for canopy coverage and fill in all the information about the trait and the method. Create an assay with as output a data file. Create a row for each separate measurement/experimental group, with as input the observation unit plots.  Describe the output data file of the measurement and link to the data. 

Create one sequencing assay stream. Describe the library construction and sequencing. Create an assay with as output a data file. Create a row for each measurement, with as input a sample. Describe the output data file of the measurement and link to the data. 

Create one phenotyping assay stream for the greenhouse sensors. Create an assay for the measurements of the output material with the template observation. Define one row per environment variable measured by the greenhouse sensors, describing the variable, the sensor and the scale. This can be one row for temperature and one for humidity. The input is the study observation unit greenhouse. Create a next assay in the stream for the data files, one row for each file, with as input the assay row defined in the previous assay. Describe the and link to the data. 

 