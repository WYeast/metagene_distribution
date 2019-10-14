#!/usr/bin/perl

use strict;
use warnings;

open IN,"$ARGV[0]" or die $!;    ## ENST_to_refseq_table 
open IN2,"$ARGV[1]" or die $!;   ## files to be processd
open OUT,">$ARGV[2]" or die $!;   ## processed file

my %hash;
while(<IN>){
    chomp;
    my @sp=split /\s+/;
    $hash{$sp[0]}=$sp[1];
}                                       
## key=ENST_number. value= NM_number
while(<IN2>){
    chomp;
    my @sp=split /\s+/;
    if($hash{$sp[6]}){
    print OUT "$hash{$sp[6]}\t$sp[3]\n";
    }
}


