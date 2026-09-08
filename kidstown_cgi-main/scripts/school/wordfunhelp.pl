#!/usr/bin/perl

   print "<HEAD>\n";
   print "<TITLE>KidsTown: School: Word Fun: Help</TITLE>\n";
   print "</HEAD>\n";
   print "<BODY BGCOLOR=\"#FFFFFF\" TEXT=\"#000000\" LINK=\"ff0000\" ALINK=\"990000\" VLINK=\"990000\">\n";
   print "<CENTER>\n";
   print "<H1>Welcome to the Word Fun Activity Help Page</H1>\n";
   print "<FORM METHOD=\"POST\" ACTION=\"$ktini{engine}\">\n";
   print "<INPUT TYPE=HIDDEN NAME=KEY VALUE=4001>\n"; 
   print "<TABLE WIDTH=600 BORDER=0>\n";
   print "<TR><TD WIDTH=100></TD><TD WIDTH=400></TD><TD WIDTH=100></TD></TR>\n";   
   print "<TR>\n";
   print "<TD COLSPAN=3>\n";
   print "<BR>\n";
   print "<HR>\n";
   print "<H2>\n";
   print "<UL>\n";
   print "<LI>This is a spelling activity with the word difficulty based on the level you chose.</LI>\n";
   print "<BR>\n";
   print "<LI>The object is to try and guess the correct word given the number of letters in it.</LI>\n";
   print "<BR>\n";
   print "<LI>Click on a letter button; if the letter you clicked on is in the word, it will appear in one or more of the blanks.</LI>";
   print "<BR>\n";
   print "<LI>If the letter is not in the word, you are given another chance to guess a correct one.</LI>\n";
   print "</H2>\n";
   print "</UL>\n";
   print "</TD>\n";
   print "</TR>\n";
   print "</TABLE>\n";
   print "</FORM>\n";
   print "<A HREF=\"$ktini{engine}?KEY=4001\">Play the word fun activity</A>\n";
   print "</CENTER>\n";
   print "</BODY>\n";

