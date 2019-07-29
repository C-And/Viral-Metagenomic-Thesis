#!/bin/sh
#$ -cwd 
#$ -pe smp 1
#$ -l h_rt=0:30:0
#$ -l h_vmem=8G
#$ -m bea

# this script is meant to translate the output from the 'kraken' function in a Krona plot
# this is the first iteration of the this script for the full data set.


# working directories

wd_logs='/data/home/bt1856/ViralMetaGen/shotgun_CoDL/scripts/logs'
wd_output='/data/scratch/bt18567/3_Tax_Full'


PATH=/data/home/bt18567/containers/Krona/KronaTools/scripts/:$PATH


# kraken mini database path

minikraken_8GB='/data/scratch/bt18567/kraken/minikraken_8GB'

# load kraken - NOTE: I'm doing it HERE because I want to add the version of kraken to the log file

module load kraken

# create and update log file

cd $wd_logs	

touch CoDL_krona_full.sh.log.txt


echo 'Assigning taxonomy to full CoDL shotgun dataset' >> CoDL_krona_full.sh.log.txt
kraken --version >> CoDL_krona_full.sh.log.txt
echo 'Job started at:' >> CoDL_krona_full.sh.log.txt
date >> CoDL_krona_full.sh.log.txt

cd $wd_output

kraken-translate --db $minikraken_8GB \
CoDL_016.kraken.out > CoDL_16.kraken.label
cat CoDL_16.kraken.label | cut -f 2 | sort | uniq -c | tr ';' '\t' > CoDL_16.krona.txt

kraken-translate --db $minikraken_8GB \
CoDL_017.kraken.out > CoDL_17.kraken.label
cat CoDL_17.kraken.label | cut -f 2 | sort | uniq -c | tr ';' '\t' > CoDL_17.krona.txt

kraken-translate --db $minikraken_8GB \
CoDL_019.kraken.out > CoDL_19.kraken.label
cat CoDL_19.kraken.label | cut -f 2 | sort | uniq -c | tr ';' '\t' > CoDL_19.krona.txt

# Now use krona scripts to produce the plot

/data/home/bt18567/containers/Krona/KronaTools/scripts/ImportText.pl -o CoDL_full_krona.html CoDL_??.krona.txt

# Update logfile

cd $wd_logs

echo 'script history:' >> CoDL_krona_full.sh.log.txt
cat ../CoDL_krona_full.sh >> CoDL_krona_full.sh.log.txt
echo 'Job finished at:' >> CoDL_krona_full.sh.log.txt
date >> CoDL_krona_full.sh.log.txt
echo "NOW ITS A GHOST TOWN

" >> CoDL_krona_full.sh.log.txt

