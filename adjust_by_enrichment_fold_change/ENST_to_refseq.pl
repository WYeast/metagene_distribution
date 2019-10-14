#!/usr/bin/perl

use strict;
use warnings;

open IN,"$ARGV[0]" or die $!;    ## ENST_to_refseq_table 
open IN2,"$ARGV[1]" or die $!;   ## files contain enrichment
open IN3,"$ARGV[2]" or die $!;   ## files to be processd
open OUT,">$ARGV[3]" or die $!;   ## processed file
my %hash;
my %hash2;
while(<IN>){
	chomp;
	my @sp=split /\s+/;
	$hash{$sp[0]}=$sp[1];     ## key=ENST_number. value= NM_number
}                              
while(<IN2>){
	chomp;
	my @sp=split /\s+/;
	$hash2{$sp[0]}=$sp[3];   ## key=group_number. value= enrichment
}                                      
while(<IN3>){
	chomp;
	my @sp=split /\s+/;
	if($hash{$sp[6]}){
	    print OUT "$hash{$sp[6]}\t$sp[3]\t$hash2{$sp[1]}\n";
    }
}


