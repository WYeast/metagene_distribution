#!/usr/bin/perl

use strict;
use warnings;

open IN,"$ARGV[0]" or die $!;    ## files to be processd
open OUT,">$ARGV[1]" or die $!;   ## processed file

my $midpoint;
while(<IN>){
	chomp;
	my @sp=split /\s+/;
    if($sp[1]!=($midpoint+1)){
    	$midpoint=$sp[1];
    	print OUT "$_\n";
    }
}