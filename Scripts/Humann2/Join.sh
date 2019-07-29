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
touch Join.sh.log.txt

echo 'Joining of the individual tables into one whole table' >> Join.sh.log.txt
date >> Join.sh.log.txt


cd $wd_output



#runs the join function of humann2 that is built in to get all the tables together 
singularity exec /data/SBCS-Informatics/containers/biobakery.simg \
humann2_join_tables --input /data/scratch/bt18567/$$$what_ever_i_call_this_directory \
--output functional.tsv



#copy the script to the log file to see what you ran so changes made later are easier to see

cd $wd_logs

cat ../Join.sh >> Join.sh.log.txt

echo 'Job finished at: ' >> Join.sh.log.txt
date >> Join.sh.log.txt
echo "NOW ITS A GHOST TOWN





" >> Join.sh.log.txt
