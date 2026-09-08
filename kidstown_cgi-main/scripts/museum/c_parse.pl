#!/usr/bin/perl

################ Here's that snip-it #######################
############################################################
# This file contains utilities which are used to interact
# with data files of a common structure.  The structure is
# described below.
#
# GetRecord:
#   This utility requires the name of a file and a record
#   number as input.  The requested record is returned from
#   the file.  Each field name is returned with it's
#   associated value.  Here's a sample call:
#      $record = &GetRecord("filename",1);
#   In this example the first record in "filename" is
#   returned.  Here's the structure of the expected data
#   file:
#      Line 1 tells the purpose of the file
#      lines 2-n are comments
#      .
#      FIELD1	value1
#      FIELD2	value2
#      FIELD3	value3
#      .
#   Each record is delimited by a single "." followed by a
#   newline.  The field and value of a record are separated by
#   a single tab.  The value may span multiple lines, however,
#   the value may NOT contain a tab.
#   Using the example above, the value of the second field
#   may be printed by using the following command:
#      print $record{'FIELD2'};
#
# CountRecords:
#   This utility return the number of records in the data
#   file specified by the input.  The structure of the
#   data file is the same as that mentioned under GetRecord
#
############################################################

sub GetRecord
{
   #
   # name the input parameters
   #
   local ($file,$rec_num) = @_ if @_;

   #
   # open the file for reading or register an error and exit
   #
   open(FD,$file) || die("Unable to open $file\n");

   #
   # parse out any lines before the desired record
   #
   for ($count = 0, $_ = 1; ($_) && ($count < $rec_num); $count++)
   {
      while (($_ = <FD>) && ($_ ne ".\n")) {}
      while (($_ = <FD>) && ($_ eq ".\n")) {}
   }

   #
   # extract the record
   #
   while (($_) && ($_ ne ".\n"))
   {
      ($_ ne "\n") && ($record .= $_);
      $_ = <FD>;
      !(/\t/)  && (substr($record , -1, 1) = " ");
   }

   #
   # close the file
   #
   close(FD);

   #
   # if not eof, chop of the last newline and split the record on \n
   #
   $_ && chop($record) && (@record = split(/\n/,$record));

   #
   # split the record on \t and associate the value with the tag
   #
   foreach $i (0..$#record)
   {
      ($tag,$val) = split(/\t/,$record[$i],2);
      $record{$tag} .= $val;
   }

   #
   # return the record if the data was retrieved, NULL otherwise
   #
   scalar(@record) if (($rec_num > 0) && ($_ eq ".\n"));
}

sub CountRecords
{
   #
   # name the input parameter @input
   #
   local ($in) = @_ if @_;
   #
   # open the file for reading or register an error and exit
   #
   open(FD,$in) || die("Unable to open $in\n");

   #
   # get to the first .\n
   #
   while (($filein = <FD>) && ($filein ne ".\n")) { }

   #
   # count the records
   #
   for ($count = 0, $first = $_, $second = <FD>; $second ; $second = <FD>)
   {
      ($second eq ".\n") && ($first ne ".\n") && $count++;
      $first=$second;
   }

   #
   # close the file
   #
   close(FD);

   #
   # return the number of records
   #
   scalar($count);
}



#
# return a 1 for the "require" statement
#
1;


############# This is the end ##############################
