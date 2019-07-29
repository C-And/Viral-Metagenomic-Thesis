#!/bin/sh
#$ -cwd 
#$ -pe smp 1
#$ -l h_rt=1:0:0
#$ -l h_vmem=16G
#$ -m bea

# working directories

wd_logs='/data/home/bt18567/ViralMetaGen/shotgun_CoDL/scripts/logs'
wd_output='/data/scratch/bt18567/2_Trim_Full/'

# LOGS

cd $wd_logs	

touch CoDL_trimgalore_full.sh.log.txt

echo 'Trimming CoDL shotgun dataset in full' >> CoDL_trimgalore_full.sh.log.txt

echo 'Job started at:' >> CoDL_trimgalore_full.sh.log.txt

date >> CoDL_trimgalore_full.sh.log.txt

module load trimgalore 

echo 'Using:' >> CoDL_trimgalore_full.sh.log.txt

trim_galore --version >> CoDL_trimgalore_full.sh.log.txt

cd $wd_output

trim_galore --paired --quality 20 --stringency 4 \
../samples/16_S4_R1_001.fastq \
../samples/16_S4_R2_001.fastq \
--output_dir ./ --fastqc \


trim_galore --paired --quality 20 --stringency 4 \
../samples/17_S5_R1_001.fastq \
../samples/17_S5_R2_001.fastq \
--output_dir ./ --fastqc \

trim_galore --paired --quality 20 --stringency 4 \
../samples/19_S6_R1_001.fastq \
../samples/19_S6_R2_001.fastq \
--output_dir ./ --fastqc \

cd $wd_logs

echo 'Job finished at:' >> CoDL_trimgalore_full.sh.log.txt
date >> CoDL_trimgalore_full.sh.log.txt
echo "NOW ITS A GHOST TOWN 

" >> CoDL_trimgalore_full.sh.log.txt

