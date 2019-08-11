# README
Repository dedicated to Master thesis titled: A Comparison of Bioinformatic Tools and Approaches for Identifying Viral Sequences within Hydrothermal Vent Bacterial Metagenomes.

## CoDL_full_krona
This is a HTML file that contains the interactive output from the krona script. 

## Scripts
This folder contains the scrips used in the intial parts of the investigation in order to perform taxonomic profiling on the Svalbard data. 

**CoDL_kraken_full.sh**
Script writen to use the Kraken tool to label short dna reads woth taxonomic labels. 

**CoDL_krona_full.sh**
Script to visualise the Kraken outputs and create an interactive html file as the ouput. 

**CoDL_trimgalore_full.sh**
Script that utilises the TrimGalore! programmes to remove ends of the data. 

**subsample_seq.sh**
Script that creates a subsample of the data to ensure that the other scripts run as required. 

## Humann2
This folder contains all the scripts and data needed to run Humann2 and create a functional profile. 

**Humann2_16/17/19.sh**
Scripts to use the initial basics of humann to get functional information. 

**Join.sh**
Script to join the table outputs from the Humann2 scripts. 

**Renorm.sh**
Script to renormalise the data over all the tables within output from the join script. 

**Stats.sh**
Script to carry out a statistical analysis of the data using built in function of humann2

**Visual.sh**
Script t0 visualise the data - built in version not used in final thesis. 

**pathabundance2.cpm.anno.plc**
Data used for the stats and visual scripts. this is the output of the renorm script with metadata added.

## Data_Visual
everything used to visualise the data of the humann2 scripts. 

**codl_shotgunmg_metadata.tsv**
Metadata of the Svalbard dataset 

**functional.cpm.tsv**
Data output of the renorm humann2 script. 

**metadata.r**
Script to added metadata to the renormalised data as well as produce heat maps for visualisation. 

**Heatmap_X-X**
Images of the data in a heat map form, each image shows 50 samples from the data. 
