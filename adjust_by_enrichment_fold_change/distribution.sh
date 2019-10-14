#!/bin/bash
for samp in merip.1 merip.2 ; do
##  If input peak files are not single-based peak summit file, run following lines in advance

#### perl calculate_midpoint.pl ${samp}.peak.bed ${samp}.midpoint.enrichment.txt
#### perl remove_adjacent_bp.pl ${samp}.midpoint.enrichment.txt ${samp}.midpoint.enrichment_for_processing.txt


##  convert genomic coordinates to transcriptomic coordinates,${samp}_ENST.txt will be generated as output files
    Rscript genome_to_transcript.R 
    sed -i 's/"//g' ${samp}_ENST.txt
  
##  convert Ensembl ID into NCBI ID
    perl ENST_to_refseq.pl ENST_to_refseq.txt ${samp}.midpoint.enrichment_for_processing.txt ${samp}_ENST.txt ${samp}_refseq.txt

##  annotate 5utr/cds/3utr to sites
    perl annotate_region.pl ${samp}_refseq.txt ${samp}_refseq_annotated.xls

##  calculate relative coordination on virtual transcript and count sites within each bin for drawing of distribution profile
    perl calculate_distribution_enrichment.pl ${samp}_refseq_annotated.xls ${samp}_distribution.xls
done
