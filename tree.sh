#!/bin/bash

input=SNPs_original.txt

mkdir Data/ Alignment/ Tree/

# Data manipulation

output1=./Data

cut -f 4- ${input} > ${output1}/SNPs_samples_only.txt
head -n 1 ${output1}/SNPs_samples_only.txt > ${output1}/Samples_headerOnly.txt
tail -n 1000 ${output1}/SNPs_samples_only.txt > ${output1}/SNPs_1000.txt
cat ${output1}/Samples_headerOnly.txt ${output1}/SNPs_1000.txt > ${output1}/SNPs+header_merged.txt
datamash transpose < ${output1}/SNPs+header_merged.txt > ${output1}/SNPs+header_transposed.txt

awk -F"\t" '{print ">"$1;"\n"} {$1=""; print $0}' OFS="" ${output1}/SNPs+header_transposed.txt > ${output1}/SNPs_transposed.fa

# Alignment

output2=./Alignment

mafft --auto ${output1}/SNPs_transposed.fa > ${output2}/SNPs_aligned.fa

# phylogenetic tree

cd ./Tree/
iqtree -s ../Alignment/SNPs_aligned.fa
