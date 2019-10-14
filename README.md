# metagene_distribution
The ideal input files are single-based .bed files. For macs2 output, the summit.bed file can be used directly. Modify the samp names in 
distribution.sh, other perl scripts should be put within same file, then run:

sh distribution.sh

In this script, genomic coordinations of peaks' summit are converted to transcriptomic coordinations, then annotated with features 
(5utr/cds/3utr) where they locate. Finally, the relative position of peaks on a virtual transcript are calculated and then assigned to the different bins.
Histogram of peak numbers within each bin is drawn to generate metagene profile.

If input files are not single-based .bed files, using 
perl calculate_midpoint.pl ${samp}.peak.txt ${samp}.midpoint.txt
perl remove_adjacent_bp.pl ${samp}.midpoint.txt ${samp}.midpoint_for_processing.txt

in the distribution.sh before convertion of genomic coordinations

If number of peaks in each bin was adjusted by enrichment fold or enrichment fold change, please use scripts in the directory "adjust_by_enrichment_fold_change"

Some of the scripts (annotate_region.pl and calculate_distribution.pl) are written by the collaboration with other people. Please contact me if these scripts are need
