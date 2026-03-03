
## What data to upload  

When deciding what data to upload in the ResilienceHub, it is important to consider what data is going to be useful to other researchers.
There are no strict rules about what data to share; standards will be developed by the consortium during the time of the consortium.

To discuss data sharing with consortium members, join the Slack channel #research-drive.


## Raw data

Raw data makes it possible to re-use data from different studies and process it all in the exact same way.
There is no universal understanding of what is considered raw data. 
It typically is the data as outputted by the instrument or received from the external company. 
The data should not be processed in a way in which assumptions and context influence the outcome of the data processing.
In case of unambiguous processing, it is possible to label processed data as raw data, for example the called bases (fastq), rather than the raw reads (pod5 or similar). 


## Processed data
It is also important to share certain processed data.
This includes output artifacts that are important to understand the study and it's outcomes, 
as well as processed data that might be used directly in a secondary analysis,
especially if the data was produced by one of the CropXR standerdized pipelines or scripts, 
and especially if the analysis is computationally heavy.

For this processed data it is important to include information on how it was generated.

Do not include intermediates that can be regenerated from the raw data and have no direct value.

Examples of data that is typically shared:

- count tables

Examples of data that is typically not shared:

- graphs used in the paper
- BAMs
