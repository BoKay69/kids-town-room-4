############################################################
#
#   Copyright (c) 1996 Paramount Consulting
#   UNPUBLISHED WORK
#   ALL RIGHTS RESERVED
#
#   Distribution or modification of this work without the
#   prior expressed written consent of Paramount Consulting
#   is strictly prohibited.
#
############################################################
# This file contains utilities which are used to interact
# with data files of a common structure.  See GetRecord
# for the strucutre definition.
#
# GetFileNames:
#   This utility requires the name of a directory for
#   input.  The files in the directory are returned to the
#   calling function.  Dot and dot-dot are omitted from
#   the returned list of files.
#
# GetRecord:
#   This utility requires the name of a file and a record
#   number as input.  The requested record is returned from
#   the file.  Each field name is returned with it's
#   associated value.  Here's a sample call:
#      $record = $GetRecord("filename",1) || die"Failed";
#   In this example the first record in "filename" is
#   returned.  (If the desired record can not be extracted,
#   the call will fail and the or clause will be
#   evaluated.)  Here's the structure of the expected data
#   file:
#      .
#      FIELD1	value1
#      FIELD2	value2
#      FIELD3	value3
#      .
#   Each record is delimited by a single "." followed by a
#   newline.  The field name and corresponding value within
#   a record are separated by a single tab.  Field names
#   should be distinct within each record.
#   Using the example above, the value of the second field
#   may be printed by issuing the following command after
#   calling GetRecord:
#      print $record{'FIELD2'};
#
# CountRecords:
#   This utility returns the number of records in the data
#   file specified by the input.  The structure of the
#   data file is the same as that mentioned under GetRecord
#
# FindRecord:
#   This utility requires as inputs, a file name, current
#   record index, and the search criteria.  It returns the
#   index of the matched record, or 0 otherwise.
#
# WriteRecord:
#   This utility takes a file name and a record as input and
#   writes the record to the file.
#
# RemoveRecord:
#   This utility takes a file name and a record index as
#   input.  The record number denoted by the index is removed
#   from the file.
#
############################################################
sub GetFileNames
{
   #
   # name the input parameter @file_dir
   #
   local ($file_dir) = @_ if @_;

   #
   # open the directory for reading or register an error and exit
   #
   opendir(DIR,$file_dir) || &Die("Unable to open directory $file_dir");

   #
   # delete dot and dot-dot from the list of files
   #
   @files = grep(!/^\.\.?$/,readdir(DIR));

   #
   # close the directory
   #
   closedir(DIR);

   #
   # loop through the list of files, extracting their descriptions from the first line
   #
   foreach $i (0..$#files)
   {
      open(FD,$file_dir.$files[$i]) || &Die("Unable to open file $file_dir.$files[$i]");
      $files[$i] = $files[$i]."\t".(($_ = <FD>) ? $_ : "File contains no records\n");
      close(FD);
   }

   #
   # return the list of files
   #
   scalar(@files);
}

sub GetRecord
{
   #
   # the input parameters are the file name and the record number to return
   #
   local ($file,$rec_num) = @_ if @_;

   #
   # open the file for reading or register an error and exit
   #
   print "<!--* This script and many others on this site have been\n";
   print "    * written by a member of Paramount Consulting, Inc.\n";
   print "    * and donated to the Tattered Cover for the purpose\n";
   print "    * of promoting children's literacy.\n";
   print "-->\n";
   open(FD,$file) || return -1;

   #
   # skip any lines before the desired record
   #
   for ($count = 0, $_ = 1; ($_) && ($count < $rec_num); $count++)
   {

      #
      # if we're not at eof and $count < $rec_num throw the lines away
      #
      while (($_ = <FD>) && ($_ ne ".\n")) {}

      #
      # throw away multiple ".\n" between records then increment $count
      #
      while (($_ = <FD>) && ($_ eq ".\n")) {}
   }

   #
   # the first line of the record is in $_.  while !eof and not end of record
   #
   while (($_) && ($_ ne ".\n"))
   {

      #
      # if $_ is not newline, concatenate it to $record
      #
      ($_ ne "\n") && ($record .= $_);

      #
      # read the next line.  if the line doesn't have a tab in it, it is
      # part of the previous field so replace the last newline with space.
      # 
      $_ = <FD>;
      !(/\t/) && (substr($record , -1, 1) = " ");
   }

   #
   # close the file
   #
   close(FD);

   #
   # if not eof, chop off the last space and split the record on \n
   # 
   $_ && chop($record) && (@record = split(/\n/,$record));

   #
   # split the record on \t and associate the value with the field name
   #
   foreach $i (0..$#record)
   {
      ($tag,$val) = split(/\t/,$record[$i],2);
      $record{$tag} = $val;
   }

   #
   # return the record if $rec_num > 0 and the last line read is ".\n"
   #
   scalar(@record) if (($rec_num > 0) && ($_ eq ".\n"));
}

sub CountRecords
{
   #
   # the input parameter is the file name, named $in
   #
   local ($in) = @_ if @_;

   #
   # open the file for reading or register an error and exit
   #
   open(FD,$in) || return -1;

   #
   # get to the first ".\n"
   #
   while (($_ = <FD>) && ($_ ne ".\n")) {}

   #
   # keep reading unitl eof.  $second is the current line, $first is previous
   #
   for ($count = 0, $first = $_, $second = <FD>; $second ; $second = <FD>)
   {

      #
      # if $second is a record delimiter and $first isn't, increment $count
      #
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

sub WriteRecord
{
   #
   # name the input parameters
   #
   local ($file,@record) = @_ if @_;
    
   #
   # open the file for appending or register an error
   #
   open(FD,(">>".$file)) || &Die("Unable to open file $file");

   #
   # write the record to the file or register and error
   #
   foreach $i (0..$#record)
   {
      print FD $record[$i],"\n" || &Die("Unable to write to file $file");
   }
   print FD ".\n";

   #
   # close the file and return
   #
   close (FD);
   return 1;
}

sub FindRecord
{

   #
   # name the input parameters $file, $index, and @record
   #
   local ($file,$index,@criteria) = @_;

   #
   # go through the rest of the file, matching the fields
   #
   $found = 0;
   foreach $i (($index+1)..(&CountRecords($file)))
   {

      #
      # retrieve each record
      #
      (!$found) && ($ndx = $i);
      $record = "";
      (!$found) && (($record = &GetRecord($file,$i)) ||
         (&Die("Having problems reading from file: $file")));

      #
      # go through the fields of each record
      #
      $found = 1;
      foreach $j (0..$#record)
      {

         #
         # translate some special characters to spaces
         #
         $record[$j] = substr($record[$j],index($record[$j],"\t")+1);
         $criteria[$j] =~ tr/[\.\)\(\?\*\^]/ /;
         $record[$j] =~ tr/[\.\)\(\?\*\^]/ /;
         (($found) && ((!($criteria[$j])) || ($record[$j] =~ /$criteria[$j]/))) || ($found = 0);
      }
   }

   #
   # if we haven't found the record yet, search the beginning of the file
   #
   if (!$found)
   {
      foreach $i (1..($index))
      {

         #
         # retrieve each record
         #
         (!$found) && ($ndx = $i);
         $record = "";
         (!$found) && (($record = &GetRecord($file,$i)) ||
            (&Die("Having problems reading from file: $file")));

         #
         # go through the fields of each record
         #
         $found = 1;
         foreach $j (0..$#record)
         {

            #
            # translate some special characters to spaces
            #
            $record[$j] = substr($record[$j],index($record[$j],"\t")+1);
            $criteria[$j] =~ tr/[\.\)\(\?\*\^]/ /;
            $record[$j] =~ tr/[\.\)\(\?\*\^]/ /;
            (($found) && ((!($criteria[$j])) || ($record[$j] =~ /$criteria[$j]/))) || ($found = 0);
         }
      }
   }
   
   #
   # return the appropriate value
   #
   (($found) && return ($ndx)) || return (0);
}

sub RemoveRecord
{

   #
   # get the input parameters
   #
   local ($file,$ndx) = @_;

   #
   # open a temporary file, copy the first lines of the old file, and close
   #
   open(OLD,$file) || &Die("Unable to open file $file");
   open(NEW,(">>".$file."_temp")) || &Die("Unable to open \"temp\" file");
   while (($_ = <OLD>) && (print NEW) && ($_ ne ".\n")) {}
   close (NEW);
   close (OLD);

   #
   # loop through the records in the old file and put them in the new one (except the deleted one) 
   #
   foreach $i (1..(&CountRecords($file)))
   {
      $record = "";
      ($i != $ndx) && ($record = &GetRecord($file,$i) && (&WriteRecord(($file."_temp"),@record)) ||
         &Die("Having difficulty extracting records from file: $input{'file'}"));
   }

   #
   # rename the temp file to the old file
   #
   rename (($file."_temp"),$file);
}


#
# return a 1 for the "require" statement
#
1;









