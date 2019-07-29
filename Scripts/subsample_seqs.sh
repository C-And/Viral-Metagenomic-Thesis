# this scripts subsamples all of the files to 1000000 reads

~/seqtk/seqtk sample -s 100 16_S4_R1_001.fastq.gz 1000000 > 16_S4_R1_001_subsample_1000000.fastq
~/seqtk/seqtk sample -s 100 16_S4_R2_001.fastq.gz 1000000 > 16_S4_R2_001_subsample_1000000.fastq

~/seqtk/seqtk sample -s 100 19_S6_R1_001.fastq.gz 1000000 > 19_S6_R1_001_subsample_1000000.fastq
~/seqtk/seqtk sample -s 100 19_S6_R2_001.fastq.gz 1000000 > 19_S6_R2_001_subsample_1000000.fastq

~/seqtk/seqtk sample -s 100 17_S5_R1_001.fastq.gz 1000000 > 17_S5_R1_001_subsample_1000000.fastq
~/seqtk/seqtk sample -s 100 17_S5_R2_001.fastq.gz 1000000 > 17_S5_R2_001_subsample_1000000.fastq







