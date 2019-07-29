#!/bin/sh
#$ -cwd 
#$ -pe smp 4
#$ -l h_rt=4:0:0
#$ -l h_vmem=8G
#$ -m bea

# working directories

wd_logs='/data/home/bt18567/ViralMetaGen/shotgun_CoDL/scripts/logs'
wd_scripts='/data/home/bt18567/ViralMetaGen/shotgun_CoDL/scripts'
wd_output='/data/scratch/bt18567/3_Tax_Full'

# kraken mini database path

minikraken_8GB='/data/scratch/bt18567/kraken/minikraken_8GB'

# load kraken - NOTE: I'm doing it HERE because I want to add the 
# version of kraken to the log file
# no need to go in containers or do any other gibberish - kraken is already installed on the HPC!

module load kraken

# create and update log file

cd $wd_logs	

touch CoDL_kraken_full.sh.log.txt


echo 'Assigning taxonomy to CoDL shotgun dataset in full' >> CoDL_kraken_full.sh.log.txt
kraken --version >> CoDL_kraken_full.sh.log.txt
echo 'Job started at:' >> CoDL_kraken_full.sh.log.txt
date >> CoDL_kraken_full.sh.log.txt

cd $wd_output

# CoDL16

kraken --paired \
--db $minikraken_8GB \
--threads 4 \
--output CoDL_016.kraken.out \
../2_Trim_Full/16_S4_R1_001_val_1.fq.gz \
../2_Trim_Full/16_S4_R2_001_val_2.fq.gz \

# CoDL17

kraken --paired \
--db $minikraken_8GB \
--threads 4 \
--output CoDL_017.kraken.out \
../2_Trim_Full/17_S5_R1_001_val_1.fq.gz \
../2_Trim_Full/17_S5_R2_001_val_2.fq.gz \

# CoDL19

kraken --paired \
--db $minikraken_8GB \
--threads 4 \
--output CoDL_019.kraken.out \
../2_Trim_Full/19_S6_R1_001_val_1.fq.gz \
../2_Trim_Full/19_S6_R2_001_val_2.fq.gz \

# Copy this script into the log file, so you know exactly
# what you did, what worked, what didn't and what you changed since previous iterations
# Update logfile

cd $wd_logs

cat ../CoDL_kraken_full.sh >> CoDL_kraken_full.sh.log.txt

echo 'Job finished at:' >> CoDL_kraken_full.sh.log.txt
date >> CoDL_kraken_full.sh.log.txt
echo "NOW ITS A GHOST TOWN

" >> CoDL_kraken_full.sh.log.txt
