#!/bin/bash

mkdir /home/enezer/Desktop/Jose/Alignment /home/enezer/Desktop/Jose/Tree #Creating two directories

cd ../Alignment #Changing to Alignment directory

mafft --auto /home/enezer/Desktop/Jose/Data/SNPs.fasta > /home/enezer/Desktop/Jose/Alignment/SNPS_alg.fasta # Aligning sequences from the SNPs.fasta sample file using mafft at default setting of gap opening penalt of 1.53            

cd /home/enezer/Desktop/Jose/Tree 

cp /home/enezer/Desktop/Jose/Alignment/SNPS_alg.fasta . #copying the alignment file from the Alignment directory to Tree directory

iqtree -s SNPS_alg.fasta 