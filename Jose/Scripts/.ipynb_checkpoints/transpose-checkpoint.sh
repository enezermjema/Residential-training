#!/bin/bash

## Using terminal commands we can extract those last 1000 SNPs.
## And transpose them files using datamash

#cd /home/enezer/Phylo_Assignment/Assignmet/Data  # change to the directory "data" which contains our data.

cd /home/enezer/Desktop/Jose/Data  #Changing directory to data subdirectory

cut -f 4- SNPs_original.txt > SNPs_samples_only.txt # This will extract only the samples header and SNPs characters.

head -n 1 SNPs_samples_only.txt > Samples_header.txt  # Extracting the header part of the data and input the result to  new file called$

tail -n 1000 SNPs_samples_only.txt > SNPs_1000.txt # Extracting the last 1000 snps from our data and te result are stored in a new file$

cat Samples_header.txt SNPs_1000.txt > SNPs+header_merged.txt # This will concatenate the input files to a new file containing both SNP$

datamash transpose < SNPs+header_merged.txt > SNPs+header_transposed.txt # The file is transposed prior to convertion into fasta format.
