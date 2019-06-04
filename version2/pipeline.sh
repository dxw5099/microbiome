mkdir 16S_temp
mkdir ITS_temp
mkdir fasta_16S
mkdir fasta_ITS
for sample in `ls ITS*R1*fastq.gz`
do
base=$(basename $sample "_R1_001.fastq.gz")
qsub -q highmem.q -N pre -cwd /common/genomics-core/apps/microbiome/microbiome_process_ITS.sh ${base}
done

for sample in `ls 16S*R1*fastq.gz`
do
base=$(basename $sample "_R1_001.fastq.gz")
qsub -q highmem.q -N pre -cwd /common/genomics-core/apps/microbiome/microbiome_process_16S.sh ${base}
done

qsub -q highmem.q -hold_jid pre -sync y -N qiime1 -cwd /common/genomics-core/apps/microbiome/qiime_workflow_16S_1.sh
echo "sleep 120 && echo 'Running a job...'" | qsub

qsub -q highmem.q -hold_jid qiime1,POTU*,STDIN -sync y -cwd /common/genomics-core/apps/microbiome/qiime_workflow_16S_2.sh 16S
echo "sleep 120 && echo 'Running a job...'" | qsub

qsub -q highmem.q -hold_jid qiime1,POTU*,STDIN -sync y -N qiime2 -cwd /common/genomics-core/apps/microbiome/qiime_workflow_ITS1_1.sh
echo "sleep 120 && echo 'Running a job...'" | qsub

qsub -q highmem.q -hold_jid qiime2,POTU*,STDIN -cwd /common/genomics-core/apps/microbiome/qiime_workflow_ITS1_2.sh ITS

