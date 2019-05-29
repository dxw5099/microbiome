##### ITS1 Primers Trimming #####
/common/genomics-core/anaconda2/bin/cutadapt -a CTTGGTCATTTAGAGGAAGTAA...GCATCGATGAAGAACGCAGC  -A GCTGCGTTCTTCATCGATGC...TTACTTCCTCTAAATGACCAAG  --discard-untrimmed -o ./ITS1_temp/$1_R1_ITS1.fastq.gz -p ./ITS1_temp/$1_R2_ITS1.fastq.gz  $1_S*_R1_001.fastq.gz $1_S*_R2_001.fastq.gz >./ITS1_temp/$1_ITS1.log

##### Paired-end Reads Merging #####
/common/genomics-core/anaconda2/bin/SeqPrep -f ./ITS1_temp/$1_R1_ITS1.fastq.gz  -r ./ITS1_temp/$1_R2_ITS1.fastq.gz  -1 ./ITS1_temp/$1.ITS1_unassembled_R1.fastq.gz -2 ./ITS1_temp/$1.ITS1_unassembled_R2.fastq.gz -s ./ITS1_temp/$1.ITS1_joined.fastq.gz

##### Formatting for QIIME #####
zcat ./ITS1_temp/$1.ITS1_joined.fastq.gz ./ITS1_temp/$1.ITS1_unassembled_R1.fastq.gz |cut -f1,5- -d':'|sed s/@M03606:/\>$1_/|awk '{y= i++ % 4 ; L[y]=$0; if(y==1 && length(L[1])>100) {printf("%s\n%s\n",L[0],L[1]);}}' >$1_ITS1.fasta
