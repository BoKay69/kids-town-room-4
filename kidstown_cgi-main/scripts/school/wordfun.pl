#!/usr/bin/perl
##############################################################
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
@data_files = ("$ktini{schooldata}/e_data1.txt","easy",
               "$ktini{schooldata}/e_data2.txt","medium",
               "$ktini{schooldata}/e_data3.txt","difficult");

#
# libraries required for the activity
#
require "$ktini{schoolscripts}/cgi-lib.pl";
require "$ktini{schoolscripts}/file-lib.pl";
require "$ktini{schoolscripts}/misc-lib.pl";

sub header
{
   print "<HEAD>\n";
   print "<TITLE>KidsTown: School: Word Fun</TITLE>\n";
   print "</HEAD>\n";
   print "<BODY BGCOLOR=\"WHITE\" TEXT=\"BLACK\">\n";
   print "<CENTER>\n";
   print "<FORM METHOD=\"POST\" ACTION=\"$ktini{engine}\">\n";
   print "<INPUT TYPE=HIDDEN NAME=KEY VALUE=4001>\n"; 
   print "<TABLE WIDTH=600 BORDER=0>\n";
   print "<TR><TD WIDTH=100></TD><TD WIDTH=400></TD><TD WIDTH=100></TD></TR>\n";   
}

sub footer
{
   print "</TABLE>\n";
   print "</FORM>\n";
   print "</CENTER>\n";
   print "</BODY>\n";
}

sub intro
{
   #print "DEBUG: at intro\n";
   
   print "<TR>\n";
   print "<TD COLSPAN=3>\n";
   print "<CENTER><H1>Welcome to the Word Fun Activity</H1></CENTER><HR>\n";
   print "<CENTER>";
   print "<h2>Please choose a level of difficulty by selecting a level below.";
   print "<BR>Click on the \"Start Game\" button to begin playing.</h2>\n";
   print "</CENTER>\n";
   print "</TD>\n";
   print "</TR>\n";
   print "<TR>\n";
   print "<TD>\n";
   print "<IMG SRC=\"$ktini{'schoolgraphics'}/blocks-left.gif\"
ALIGN=\"LEFT\">\n";
   print "</TD>\n";
   print "<TD>\n";  
   print "<TABLE BORDER=0>\n";  
   print "<TR><TD WIDTH=100><CENTER><H3>Level </H3></CENTER></TD>\n";
   print "<TD><CENTER><H3>Example Words</H3></CENTER></TD></TR>\n";
   print "<TR>\n";
   print "<TD><input type=radio name=file value=\"$data_files[0]\"
checked>\n"; 
   print "<B>Easy</B></TD>\n";
   print "<TD><B>- fish, ball, and bed</B></TD>\n";
   print "</TR>\n";
   print "<TR>\n";
   print "<TD><input type=radio name=file value=\"$data_files[2]\">\n";
   print "<B>Medium</B></TD>\n";
   print "<TD><B>- basketball, flying, and staple</B></TD>\n";
   print "</TR>\n";
   print "<TR>\n";
   print "<TD><input type=radio name=file value=\"$data_files[4]\" >\n";
   print "<B>Difficult</B></TD>\n";
   print "<TD><B>- stethoscope and application</B></TD>\n";
   print "</TR>\n";
   print "</TD></TR>\n";   
   print "</TABLE>\n";
   print "<h3><BR><CENTER>\n";
   print "<FONT SIZE=+2>\n";
   print "<input type=submit name=continue value=\"Start Game\">\n";
   print "</FONT>\n";
   print "</CENTER>\n";
   print "</TD>\n";
   print "<TD>\n";
   print "<img src=\"$ktini{'schoolgraphics'}/blocks-right.gif\"
align=right>\n";
   print "</TD>\n";
   print "</TR>\n";
   print "</CENTER>\n";
}

MAIN:
{

   #
   # Output header
   #
   
   header();
      
   #
   # If there is no input or the operator selected 'Start Over'
   # then show the introduction
   #
   if ( !defined($ktvars{'file'}) || defined($ktvars{'START_OVER'}) )
   {
   
      #print "DEBUG: at choose level\n";

      #
      # print the instructions for selecting the data file
      #
      intro();	

   }

   #
   # else if a file has been selected and the user hasn't made a guess
   #   (this is the first screen of the activity)
   #
   elsif ( defined($ktvars{'file'}) && !defined($ktvars{'choice'}) )
   {
      #print "DEBUG: at first screen\n";
      #print "DEBUG: file = $ktvars{'file'}\n";     
      #
      # get the number of records in the file
      #
      $rec_count = &CountRecords($ktvars{'file'}) ||
         &Die("There are no records in $ktvars{'file'}");

      #print "DEBUG: rec_count = $rec_count\n";
      #
      # pick a random record in the file
      #
      srand(time||$$);
      $index = int(rand($rec_count)) + 1;
      (!($record = "")) && ($record = &GetRecord($ktvars{'file'},$index) ||
         &Die("Having difficulty extracting records from file: $ktvars{'file'}"));

      #
      # translate the word to all uppercase and initialize the used-letter list
      #
      $word = $record{'WORD'};
      $word =~ tr/a-z/A-Z/;
      $deadlet = ".";
      $file = $ktvars{'file'};
   }

   #
   # else if the operator has made a choice and there's a filename
   #      and a word as input
   #
   elsif ( defined($ktvars{'choice'}) && defined($ktvars{'file'}) && defined($ktvars{'word'}) )
   {

      #
      # extract all the input appending the choice to the used letters
      #
      $deadlet = $ktvars{'deadlet'}.$ktvars{'choice'};
      $word = $ktvars{'word'};
      $index = $ktvars{'index'};
      $file = $ktvars{'file'};
   }

   #
   # else we've encountered a fatal error
   #
   else
   {
      &Die("The server has encountered a fatal error");
   }
   
   #
   # create the current state of the guessed word
   #

   ($word) && ($current = $word)  && ($current =~ s/[^$deadlet]/_/g);

   #
   # if the entire word has been guessed
   #
   if (($word) && ($word eq $current))
   {

      #
      # print the number of tries that it took
      #
      $deadlet =~ s/ //g;
      print "<TR>\n";
      print "<TD COLSPAN=3>\n";
      print "<center><h3>That's correct!  The word is <i>$word.</i><br>\n";
      print "Good job, you got it in ",(length($deadlet)-1)," tries!</h3></center><br>\n";

      #
      # extract the record for the sentence and graphic
      #
#      (!($record = "")) && ($record = &GetRecord($file,$index) ||
     ($record = &GetRecord($file,$index) ||
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
      print "<center><img src=\"$ktini{schoolgraphics}/$record{GRAPHIC}\">";
      print "<h3>$record{'SENTENCE'}</h3></center><br>\n";

      #
      # print a continue button
      #
      print "<FONT SIZE=+2>\n";
      print "<center><input type=submit name=play_again value=\"Play Again\"></center><BR>\n";
      print "<CENTER><INPUT TYPE=SUBMIT NAME=START_OVER VALUE=\"Change Level\"></CENTER>\n";
      print "</FONT>\n";

      # Make the CGI think that we are coming in from the level selection page	
      print "<input type=hidden name=file value=\"$file\">";
      print "</TD>\n";
      print "</TR>\n";
   }

   #
   # else a file has been selected && start over hasn't been selected
   #
   elsif ( defined($ktvars{'file'}) && !defined($ktvars{'START_OVER'}) )
   {
      print "<TR>\n";  
      print "<TD COLSPAN=3><center><h2>Select a letter from below</h2></center></TD>\n";
      print "</TR>\n";	
      
      #
      # print the instructions and some required hidden values
      #
      print "<TR>\n";
      print "<TD>\n";
      print "<img src=\"$ktini{'schoolgraphics'}/blocks-left.gif\" align=left>";
      print "</TD>";    
      print "<TD>\n";
      print "<CENTER><CODE>\n";
      print "<input type=hidden name=word value=\"$word\">";
      print "<input type=hidden name=deadlet value=\"$deadlet\">";
      print "<input type=hidden name=file value=\"$file\">";
      print "<input type=hidden name=index value=\"$index\">";

      #
      # put a space between each letter of the current guess and output it
      #
      $current =~ s/./$& /g;
      #print "DEBUG: current = $current<BR>\n";

      print "<center><FONT SIZE=+2>$current<br></FONT></center>\n";
      print "<BR></CODE></CENTER>\n";
      print "</TD>\n";
      print "<TD>";
      print "<img src=\"$ktini{'schoolgraphics'}/blocks-right.gif\" align=right>";
      print "</TD>";
      print "</TR>\n";
      
      #
      # print the buttons
      #
      print "<TR>\n";
      print "<TD COLSPAN=3><CENTER><CODE>\n";
      print "<BR>\n";
      
      foreach $i (A..Z)
      {
      #
         $type = (($deadlet =~ /$i/) ? "reset value=\"  -  \"" : "submit value=\"  $i  \"");
         ($i eq 'H' || $i eq 'O' || $i eq 'V') && print "<BR>";
         print "<input type=$type name=\"choice\">\n";
      }
      print "</FONT></CODE></CENTER>\n";
      print "</TD>\n";
      print "</TR>\n";
   }

   footer();   
}
