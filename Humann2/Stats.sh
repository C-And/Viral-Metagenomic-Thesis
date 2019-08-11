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
touch Stats.sh.log.txt

echo 'Statistical analysis to identify those profiles that are significantly different' >> Stats.sh.log.txt
date >> Stats.sh.log.txt


cd $wd_output



#statisctial analysis. 
singularity exec /data/SBCS-Informatics/containers/biobakery.simg \
humann2_associate --input pathabundance2.cpm.anno.plc --last-metadatum mean_depth --focal-metadatum mean_depth \
--focal-type categorical --output stats.txt



#copy the script to the log file to see what you ran so changes made later are easier to see

cd $wd_logs

cat ../Stats.sh >> Stats.sh.log.txt

echo 'Job finished at: ' >> Stats.sh.log.txt
date >> Stats.sh.log.txt
echo "NOW ITS A GHOST TOWN





" >> Stats.sh.log.txt
