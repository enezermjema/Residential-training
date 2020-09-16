#!/usr/bin/python

#converting the SNPs text file into a fasta format,
#using a biopython package

from Bio.Seq import Seq
from Bio.SeqRecord import SeqRecord
from Bio.Alphabet import IUPAC
with open('/home/enezer/Phylo_Assignment/Assignmet/Data/SNPs+header_transposed.txt') as text:
    with open('/home/enezer/Phylo_Assignment/Assignmet/Data/SNPs.fasta', 'w') as f_format:
        for l in text:
            SNP_list = l.split() 
            header = SNP_list[0]
            SNPs = SNP_list[1:]
            #print(SNPs)
            sequence = ''.join(SNPs)
            Seq_new = SeqRecord(Seq(sequence, IUPAC.extended_dna), 
                                id = header, name=header, description="Sample_origin")
            fastA = Seq_new.format('fasta')
            #print(fastA)
            f_format.writelines(fastA)