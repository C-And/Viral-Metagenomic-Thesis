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
touch Visual.sh.log.txt

echo 'Visualising the functional profile data' >> Visual.sh.log.txt
date >> Visual.sh.log.txt


cd $wd_output



#bar plot visual using the built in features of Humann2 rather then utalising metadata files that need to be created. 
singularity exec /data/SBCS-Informatics/containers/biobakery.simg \
humann2_barplot --input functional.cpm.tsv --feature $$$CHOOSE \
--output /data/scratch/bt18567/



#copy the script to the log file to see what you ran so changes made later are easier to see

cd $wd_logs

cat ../Visual.sh >> Visual.sh.log.txt

echo 'Job finished at: ' >> Visual.sh.log.txt
date >> Visual.sh.log.txt
echo "NOW ITS A GHOST TOWN





" >> Visual.sh.log.txt
