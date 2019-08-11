#!/bin/sh
#$ -cwd
#$ -pe smp 4
#$ -l h_rt=24:0:0
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
touch Renorm.sh.log.txt

echo 'Renormalising data across all sets not just individuals' >> Renorm.sh.log.txt
date >> Renorm.sh.log.txt


cd $wd_output



#execution of the humann2 command to renormalise over al the data by counts per million. 
singularity exec /data/SBCS-Informatics/containers/biobakery.simg \
humann2_renorm_table --input functional.tsv \
--output functional.cpm.tsv 



#copy the script to the log file to see what you ran so changes made later are easier to see

cd $wd_logs

cat ../Renorm.sh >> Renorm.sh.log.txt

echo 'Job finished at: ' >> Renorm.sh.log.txt
date >> Renorm.sh.log.txt
echo "NOW ITS A GHOST TOWN





" >> Renorm.sh.log.txt
