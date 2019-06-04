#$ -v PATH=/hpc/apps/python27/externals/toolshed/0.4.0/bin:/common/genomics-core/anaconda2/envs/qiime1/bin:/common/genomics-core/anaconda2/condabin:/common/genomics-core/apps/.bds:/common/genomics-core/anaconda2/bin/:/opt/xcat/bin:/opt/xcat/sbin:/opt/xcat/share/xcat/tools:/opt/sge/bin:/opt/sge/bin/lx-amd64:/usr/local/bin:/usr/bin:/usr/local/sbin:/usr/sbin:/home/wud3/.local/bin:/home/wud3/bin
##### Generate OTU table #####
sleep 60

make_otu_table.py -i otus_gg_13_5_97/$1_otus.txt -o $1_table.biom -t /home/genomics/genomics/reference/Microbiome/gg_13_5_97_otus.taxonomy
##### Convert into TXT format #####

biom convert -i $1_table.biom -o $1_table_gg.txt  --to-tsv --header-key="taxonomy"

##### Count mapped reads from OTU table #####
#biom summarize-table -i 16S_GreenGenes.biom

biom summarize-table -i $1_table.biom

echo "Subject: 16S_processing is done" | sendmail -v di.wu@cshs.org
##### Extra manipulations #####
##### Summarize profiles at all Taxonomy levels #####
#summarize_taxa.py -i Sorted_otu_table_$1.biom   -o Taxa_summary

##### Filter OTU table by sample names #####
#filter_samples_from_otu_table.py -i otu_table.biom -o filtered_otu_table.biom --sample_id_fp ids.txt

##### Filter OTU table by relative abundance #####
#filter_otus_from_otu_table.py -i filtered_otu_table.biom -o Sorted_otu_table_$1.biom --min_count_fraction 0.00001

##### for more scripts, visit http://qiime.org/scripts/index.html #####
