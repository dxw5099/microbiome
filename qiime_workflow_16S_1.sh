##### Now load qiime by running 'source activate qiime1' at genomics@csclprd1-s1v  #####

##### Standard Deliverable #####
##### Perform alignment #####
#source activate qiime1
#$ -v PATH=/hpc/apps/python27/externals/toolshed/0.4.0/bin:/common/genomics-core/anaconda2/envs/qiime1/bin:/common/genomics-core/anaconda2/condabin:/common/genomics-core/apps/.bds:/common/genomics-core/anaconda2/bin/:/opt/xcat/bin:/opt/xcat/sbin:/opt/xcat/share/xcat/tools:/opt/sge/bin:/opt/sge/bin/lx-amd64:/usr/local/bin:/usr/bin:/usr/local/sbin:/usr/sbin:/home/wud3/.local/bin:/home/wud3/bin

#parallel_pick_otus_blast.py -i ITS.fna  -b /common/genomics-core/reference/Microbiome/THFv1.61.sort.fasta -O 120 -o otus_THFv1.61
#/common/genomics-core/anaconda2/envs/qiime1/bin/parallel_pick_otus_blast.py -i 16S.fna  -b /common/genomics-core/reference/Microbiome/gg_13_5_97_otus.fasta -O 120 -o otus_gg_13_5_97
parallel_pick_otus_blast.py -i 16S.fna  -b /common/genomics-core/reference/Microbiome/gg_13_5_97_otus.fasta -O 120 -o otus_gg_13_5_97

