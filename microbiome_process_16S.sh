##### 16S Primers Trimming #####
/common/genomics-core/anaconda2/bin/cutadapt -a AGAGTTTGATCMTGGCTCAG...TACGGRAGGCAGCAG  -A CTGCTGCCTYCCGTA...CTGAGCCAKGATCAAACTCT --discard-untrimmed -o ./Di_temp/$1_R1_16S.fastq.gz -p ./Di_temp/$1_R2_16S.fastq.gz  $1_*_R1_001.fastq.gz $1_*_R2_001.fastq.gz >./Di_temp/$1_16S.log


##### Paired-end Reads Merging #####
/common/genomics-core/anaconda2/bin/SeqPrep -f ./Di_temp/$1_R1_16S.fastq.gz  -r ./Di_temp/$1_R2_16S.fastq.gz  -1 ./Di_temp/$1.16S_unassembled_R1.fastq.gz -2 ./Di_temp/$1.16S_unassembled_R2.fastq.gz -s ./Di_temp/$1.16S_joined.fastq.gz

##### Formatting for QIIME #####
zcat ./Di_temp/$1.16S_joined.fastq.gz ./Di_temp/$1.16S_unassembled_R1.fastq.gz |cut -f1,5- -d':'|sed s/@M03606:/\>$1_/|awk '{y= i++ % 4 ; L[y]=$0; if(y==1 && length(L[1])>100) {printf("%s\n%s\n",L[0],L[1]);}}' >$1_16S.fasta

