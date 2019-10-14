#!/usr/bin/perl

use strict;
use warnings;

open IN,"$ARGV[0]" or die $!;    ## files to be processd
open OUT,">$ARGV[1]" or die $!;   ## processed file

while(<IN>){
	chomp;
	my @sp=split /\s+/;
	my $midpoint=int(0.5*($sp[1]+$sp[2]));
	print OUT "$sp[0]\t$midpoint\n";
}