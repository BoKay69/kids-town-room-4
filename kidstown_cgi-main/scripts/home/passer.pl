#!/usr/bin/perl

$FILE=$ktvars{passer_file_name};

open FILE or die "Can't open file $FILE: $!\n";
(@statList) = stat $FILE;
read FILE, $FileEval, $statList[7];
close FILE;
print "$FileEval";
