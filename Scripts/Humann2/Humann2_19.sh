#!/bin/sh
#$ -cwd
#$ -pe smp 4
#$ -l h_rt=48:0:0
#$ -l h_vmem=8G
#$ -m bea

# Working directories

wd_logs='/data/home/bt18567/ViralMetaGen/shotgun_CoDL/2_scripts/logs'
wd_scripts='/data/home/bt18567/ViralMetaGen/shotgun_CoDL/2_scripts'
wd_output='/data/scratch/bt18567/4_FunProf'

#load singularity so the biobakery container can be accessed

module load singularity


#create and update the log file

cd $wd_logs
touch Humann2_19.sh.log.txt

echo 'Estimating abundance for functional profile of CoDL shotgun data' >> Humann2_19.sh.log.txt
date >> Humann2_19.sh.log.txt


cd $wd_output

#test of humann2 on a singular subsample
#singularity exec /data/SBCS-Informatics/containers/biobakery.simg \
#humann2_databases --download chocophlan full /data/scratch/bt18567/Humann2
#singularity exec /data/SBCS-Informatics/containers/biobakery.simg \
#humann2_databases --download uniref uniref50_diamond /data/scratch/bt18567/Humann2



singularity exec /data/SBCS-Informatics/containers/biobakery.simg \
humann2 --input /data/scratch/bt18567/2_Trim_Full/19_S6_R1_001_val_1.fq \
--protein-database /data/scratch/bt18567/Humann2/uniref --nucleotide-database /data/scratch/bt18567/Humann2/chocophlan \
--output viral.humann2 --threads 10

singularity exec /data/SBCS-Informatics/containers/biobakery.simg \
humann2 --input /data/scratch/bt18567/2_Trim_Full/19_S6_R2_001_val_2.fq \
--protein-database /data/scratch/bt18567/Humann2/uniref --nucleotide-database /data/scratch/bt18567/Humann2/chocophlan \
--output viral.humann2 --threads 10



#copy the script to the log file to see what you ran so changes made later are easier to see

cd $wd_logs

cat ../Humann2_19.sh >> Humann2_19.sh.log.txt

echo 'Job finished at: ' >> Humann2_19.sh.log.txt
date >> Humann2_19.sh.log.txt
echo "NOW ITS A GHOST TOWN





" >> Humann2_19.sh.log.txt
