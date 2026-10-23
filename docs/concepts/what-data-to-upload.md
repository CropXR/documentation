
## What data to upload  

When deciding what data to upload in the ResilienceHub, it is important to consider what data is going to be useful to other researchers.
There are no strict rules about what data to share; standards will be developed by the consortium during the time of the consortium.

To discuss data sharing with consortium members, join the Slack channel #research-drive.


## Raw data

Raw data makes it possible to re-use data from different studies and process it all in the exact same way.
There is no universal understanding of what is considered raw data. 
It typically is the data as outputted by the instrument or received from the external company. 
Raw data should not have been processed in a way where assumptions or context affect the result.
If a processing step is unambiguous, its output can be treated as raw data. For example, you can share the called bases (fastq) instead of the raw reads (pod5 or similar). 


## Processed data
It is also important to share certain processed data.
This includes output that is needed to understand the study and its outcomes.
It also includes processed data that others might use directly in a secondary analysis,
especially if it was produced by one of the CropXR standardized pipelines or scripts,
or if the analysis takes a lot of computing power.

For processed data, always describe how it was generated.

Do not include intermediates that can be regenerated from the raw data and have no direct value.

Examples of data that is typically shared:

- count tables

Examples of data that is typically not shared:

- graphs used in the paper
- BAMs
