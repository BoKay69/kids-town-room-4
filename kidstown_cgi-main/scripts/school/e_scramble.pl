#!/usr/bin/perl
# This script is used to create the word recognition activity.
# The variable @data_files is used to describe the location
# and level of each data file used for the activity.  The
# variable should be self explanitory and is located directly
# below these comments.
#
# When the activity is entered, the first step is to give the
# user the opportunity to select the level of difficulty.
# Once this is selected, and the script is entered for the
# second time, the word will be chosen from the appropiate
# file.  During additional iterations of the script, the users
# guess will be compared with the selected word.  When the
# entire word is matched, a sentence containing the word and
# a graphic will be displayed.
##############################################################
#
# data file used for the activity with their respective levels of difficulty
#
@data_files = ("$ktini{schooldata}/e_data1.txt","short words",
               "$ktini{schooldata}/e_data2.txt","longer words",
               "$ktini{schooldata}/e_data3.txt","longest words");

#
# libraries required for the activity
#
require "$ktini{schoolscripts}/cgi-lib.pl";
require "$ktini{schoolscripts}/file-lib.pl";
require "$ktini{schoolscripts}/misc-libscr.pl";

MAIN:
{

   #
   # prepare for HTML formatted output
   #
   print "<HEAD>\n";
   print "<TITLE>KidsTown: School: Scramble Game</TITLE>\n";
   print "</HEAD>\n";
   print "<BODY BGCOLOR=\"#CCFFFF\" TEXT=\"BLACK\">\n";
   print "<CENTER>\n";
   print "<FORM METHOD=\"POST\" ACTION=\"$ktini{engine}\">\n"; 
   print "<INPUT TYPE=HIDDEN NAME=KEY VALUE=4002>\n";
   print "<TABLE WIDTH=600 BORDER=0>\n";
   print "<TR><TD WIDTH=100></TD><TDWIDTH=400></TD><TDWIDTH=100></TD></TR>\n";
                                             
   #
   # If there is no input or the operator selected 'play again' or 'return'
   #    (this is the level selection)
   #
   if (!defined($ktvars{'file'}) || defined($ktvars{'START_OVER'}))
   {

      #
      # print the instructions for selecting the data file
      #
       print "<TABLE WIDTH=600 BORDER=0>\n";
       print "<TR><TD ALIGN=CENTER>\n";
       print "<H1>Welcome to the Word Scramble Game</H1>\n";
       print "<H2>Please choose a level of difficulty by selecting a level below.";
       print "<BR>Click on the \"Start Game\" button to begin playing.</h2>\n";
       print "</TD>\n";
       print "</TR>\n";
       print "</TABLE>\n";

       print "<TABLE WIDTH=200><TR><TD>\n";
      #
      # put radio buttons by the files and output them
      #
      foreach $i (0..(int($#data_files/2)))
      {

         #
         # put the radio buttons and levels of difficulty
         #
         print "<input type=radio name=file value=\"$data_files[2*$i]\"";
         print (($i == 0) ? (" checked>  ") : (" >  "));
         print "<FONT SIZE=+1><B>$data_files[2*$i+1]</B></FONT><BR>\n";
      }

      #
      # print a submit button
      #
      print "<BR><INPUT TYPE=SUBMIT NAME=CONTINUE VALUE=\"Start Game\"><BR><BR>";

       print "</TD></TR></TABLE>\n";
   }

   #
   # else if a file has been selected, (this is the first screen of the activity)
   #
   elsif ((defined($ktvars{'file'})) &&!defined($ktvars{'guess'}))
   {

      #
      # get the number of records in the file
      #
      $rec_count = &CountRecords($ktvars{'file'}) ||
         &Die("There are no records in $ktvars{'file'}");

      #
      # pick a random record in the file
      #
      srand(time||$$);
      $index = int(rand($rec_count)) + 1;
      (!($record = "")) && ($record = &GetRecord($ktvars{'file'},$index)||
         &Die("Having difficulty extracting records from file: $ktvars{'file'}"));

      #
      # translate the word in the record to all uppercase, get the graphic, and initialize the counter
      #
      $picture = "$ktini{schoolgraphics}/$record{'GRAPHIC'}";
      $word = $record{'WORD'};
      $word =~ tr/a-z/A-Z/;
      $count = 0;
      $file = $ktvars{'file'};

      #
      # scramble the word and initialize the guess
      #
      $guess = "-" x length($word);
      $scrambled = $guess;
      foreach $i (0..(length($word)-1))
      {
         $notdone = 1;
         while ($notdone)
         {
            $dummy = int(rand(length($word)));
            (substr($scrambled,$dummy,1) eq "-") && (substr($scrambled,$dummy,1)=substr($word,$i,1)) && ($notdone=0);
         }
      }
      while($scrambled eq $word)
      {
         $guess="-" x length($word);
         $scrambled=$guess;
         foreach $i (0..(length($word)-1))
         {
            $notdone=1;
            while($notdone)
            {
               $dummy=int(rand(length($word)));
               (substr($scrambled,$dummy,1) eq 
"-")&&(substr($scrambled,$dummy,1)=substr($word,$i,1))&&($notdone=0);
            }
         }
      }
   }

   #
   # else if the operator has made a guess and there's a filename and a word as input
   #
   elsif (defined($ktvars{'guess'}) && defined($ktvars{'file'}) &&defined($ktvars{'word'}))
   {

      #
      # extract all the input and translate the guess to uppercase
      #
      $count = $ktvars{'count'};
      $scrambled = $ktvars{'scrambled'};
      $word = $ktvars{'word'};
      $picture = $ktvars{'picture'};
      $index = $ktvars{'index'};
      $file = $ktvars{'file'};
      $guess = $ktvars{'guess'};
      $guess =~ tr/a-z/A-Z/;

      #
      # check the length of the input guess
      #
      if (length($guess) != length($word))
      {
         $err_text = "<H3>The input should be of length ".length($word).".</h3><br>";
         $guess = "-" x length($word);
      }

      #
      # else if the input contains something other than letters
      #
      elsif (($guess =~ /[!-\@]/) || ($guess =~ /[\[-~]/))
      {
         $err_text = "<h3>Only use letters for input.</h3><br>";
         $guess = "-" x length($word);
      }

      #
      # else it appears that we have proper input so increment the counter
      #
      else
      {
         $count++;
      }
   }

   #
   # else we've encountered a fatal error
   #
   else
   {
      &Die("The server has encountered a fatal error");
   }

   #
   # if the entire word has been guessed
   #
   if (($word) && ($word eq $guess))
   {

      #
      # print the number of tries that it took
      #
      print "<center><h3>That's correct!  The word is <i>$word</i>.<br>\n";
      print "Good job, you got it in $count ";
      if ($count>1)
      {
         print "tries!</h3></center><br>\n";
      }
      else
      {
         print "try!</h3></center><br>\n";
      }

      #
      # extract the record for the sentence and graphic
      #
      (!($record = "")) && ($record = &GetRecord($file,$index) ||
         &Die("Having difficulty extracting records from file: $file"));      

      #
      # wrap all references to the word in the sentence with color tags
      #      and capitalize the sentence
      #
      $word =~ tr/A-Z/a-z/;
      substr($record{'SENTENCE'},0,1) =~ tr/a-z/A-Z/;
      $record{'SENTENCE'} =~ s/$word/<FONT COLOR=BLUE>$word<\/FONT>/gi;

      #
      # print the sentence and the graphic
      #
      print "<center><img src=\"$ktini{schoolgraphics}/$record{'GRAPHIC'}\">";
      print "<h2>$record{'SENTENCE'}</h2><br>\n";

      #
      # print a continue button
      #
      print "<input type=submit name=play_again value=\"Play Again\"><br><br>";
      print "<input type=submit name=START_OVER value=\"Change Level\"></center><br>\n";
      print "<input type=hidden name=file value=\"$file\">";
   }

   #
   # else if the guessed word isn't the right word and a file has been selected
   #
   elsif (defined($ktvars{'file'}) && !defined($ktvars{'START_OVER'}))
   {
      
      #
      # print the instructions, some required hidden values, and the required text
      #
      print "<center><h2>What is this picture?</h2></center>";
      print "<input type=hidden name=word value=\"$word\">\n";
      print "<input type=hidden name=count value=\"$count\">\n";
      print "<input type=hidden name=file value=\"$file\">\n";
      print "<input type=hidden name=index value=\"$index\">\n";
      print "<input type=hidden name=picture value=\"$picture\">\n";
      print "<input type=hidden name=scrambled value=\"$scrambled\">\n";
      print "<center><img src=\"$picture\"><br>\n";
      ($err_text)  && (print $err_text);
      print "<h3><pre>Scrambled Word:  $scrambled\n\n";
      print "Enter Guess: <input type=text size=",length($word)," name=guess><br>\n";
      print "Your Last Guess:  $guess\n\n";
      print "<br><input type=submit value=continue></pre><h3></center><br><br>";
   }

   #
   #  display return buttons and finish forms
   #
   print "<center>\n<table border=0 width=600 cellpadding=10>\n";
   print "<td>\n";
   print "</center>\n</table>\n</form>\n</body>\n";
}
