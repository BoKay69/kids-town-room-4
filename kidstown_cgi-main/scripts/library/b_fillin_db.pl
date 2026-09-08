#!/usr/ucb/perl
# File Name:  b_fillin_db.cgi
#
# Generates the answer pages for the Fill In The Blank activities using 
# data retrieved from "b_fillin_datafile.txt" 
#
# __________________________________________________________________________

# Use Steve Brenner's cgi-lib.pl and Aaron Swanson's file-lib.pl libraries
require "$ktini{libraryscripts}/file-lib.pl";


#Start of Main

$game_num = $ktvars{'game'} ;  #INPUT FROM FRONT-END FORM

#RETRIEVE THE APPROPRIATE RECORD FROM DATA FILE
$record = &GetRecord("$ktini{librarydata}/b_fillin_datafile.txt",$game_num) ;

#CREATE HTML DOCUMENT
print "<HTML> \n" ;
print "<HEAD><TITLE>Answers</TITLE></HEAD>\n" ;
print "<BODY BGCOLOR=\"A2F9CD\" TEXT=BLACK VLINK=\"PURPLE\" ALINK=\"RED\" LINK=\"BLUE\" > \n" ;


print "<!-- BEGIN OPENING PHRASE -->\n";
print "<CENTER> \n" ;
print "<TABLE BORDER=0 WIDTH=100%> \n" ;
print " <TR> \n" ;
print "   <TD>\n";
print "		 <IMG SRC=\"$ktini{'librarygraphics'}/$record{'PICTURE'}\"
ALIGN=\"MIDDLE\">\n" ;
print "   </TD>\n";
print " </TR>\n";
print "	  <TD>\n";
print "		 <EM> <FONT SIZE=+5 COLOR=#ff2222> 
	$record{'HEADING'}  </FONT> </EM> \n" ; 
print "   </TD>\n";
print "</TR>\n";
print "</TABLE> \n" ;
print "</CENTER> \n" ;


print "<H3>Here are the answers to the selections you made.  The answers are
       in <EM>bold</EM> type.  Included with the answers are more 
       information about the topic and information about the other choices.
       </H3> \n" ;
print "<HR> \n" ;

print "<!-- END OPENING PHRASE -->\n";
print "<!-- START OF CONTENT -->\n";

#RETRIEVE ANSWERS FROM FRONT-END FORM
$answer1 = $ktvars{'TOPIC1'} ;
$answer2 = $ktvars{'TOPIC2'} ;
$answer3 = $ktvars{'TOPIC3'} ;
$answer4 = $ktvars{'TOPIC4'} ;
$answer5 = $ktvars{'TOPIC5'} ;

#FOR EACH QUESTION, COMPARE INPUT WITH THE RIGHT ANSWER

#CHECK ANSWER #1
if ($answer1 eq $record{'SOL1'})   #right answer
{
 print "<P><BR> <FONT SIZE=+2> You're right! </FONT> <P>\n" ;
}
else 
{
 print "<P><BR> <FONT SIZE=+2> Your answer was: </FONT> \n" ;
 print "<FONT SIZE=+1> $answer1 </FONT> \n" ;
 print "<P> <FONT SIZE=+2> The correct answer is: </FONT> \n" ;
}

print "<BR> $record{'PARAGRAPH1'}  \n" ;
print "<UL COMPACT=\"COMPACT\"> \n" ;
print "<LI> $record{'ITEM1A'} </LI> \n" ;
print "<LI> $record{'ITEM1B'} </LI> \n" ;
# PRINT THIRD LINE ONLY IF THIRD ITEM IS NOT EMPTY
if ( $record{'ITEM1C'} )
{
print "<LI> $record{'ITEM1C'} </LI> \n" ;
}
print "</UL> <HR> \n" ;


#CHECK ANSWER #2
if ($answer2 eq $record{'SOL2'})   #right answer
{
 print "<P><BR> <FONT SIZE=+2> You're right! </FONT> <P>\n" ;
}
else 
{
 print "<P><BR> <FONT SIZE=+2> Your answer was: </FONT> \n" ;
 print "<FONT SIZE=+1> $answer2 </FONT> \n" ;
 print "<P> <FONT SIZE=+2> The correct answer is: </FONT> \n" ;
}

 print "<BR> $record{'PARAGRAPH2'} \n" ;
 print "<UL> \n" ;
 print "<LI> $record{'ITEM2A'} </LI> \n" ;
 print "<LI> $record{'ITEM2B'} </LI> \n" ;
# PRINT THIRD LINE ONLY IF THIRD ITEM IS NOT EMPTY
 if ( $record{'ITEM2C'} )
 {
  print "<LI> $record{'ITEM2C'} </LI> \n" ;
 }
 print "</UL> \n" ;
 print "<HR> \n" ;


#CHECK ANSWER #3
if ($answer3 eq $record{'SOL3'})   #right answer
{
 print "<P><BR> <FONT SIZE=+2> You're right! </FONT> <P> \n" ;
}
else 
{
 print "<P><BR> <FONT SIZE=+2> Your answer was: </FONT> \n" ;
 print "<FONT SIZE=+1> $answer3 </FONT> \n" ;
 print "<P> <FONT SIZE=+2> The correct answer is: </FONT> \n" ;
}

print "<BR> $record{'PARAGRAPH3'} \n" ;
print "<UL COMPACT=\"COMPACT\"> \n" ;
print "<LI> $record{'ITEM3A'} </LI> \n" ;
print "<LI> $record{'ITEM3B'} </LI> \n" ;
# PRINT THIRD LINE ONLY IF THIRD ITEM IS NOT EMPTY
if ( $record{'ITEM3C'} )
{
print "<LI> $record{'ITEM3C'} </LI> \n" ;
}
print "</UL> \n" ;
print "<HR> \n" ;

#CHECK ANSWER #4
if ($answer4 eq $record{'SOL4'})   #right answer
{
 print "<P><BR> <FONT SIZE=+2> You're right! </FONT> <P>\n" ;
}
else 
{
 print "<P><BR> <FONT SIZE=+2> Your answer was: </FONT> \n" ;
 print "<FONT SIZE=+1> $answer4 </FONT> \n" ;
 print "<P> <FONT SIZE=+2> The correct answer is: </FONT> \n" ;
}


print "<BR> $record{'PARAGRAPH4'} \n" ;
print "<UL COMPACT=\"COMPACT\"> \n" ;
print "<LI> $record{'ITEM4A'} </LI> \n" ;
print "<LI> $record{'ITEM4B'} </LI> \n" ;
# PRINT THIRD ITEM ONLY IF THIRD LINE IS NON-EMPTY
if ( $record{'ITEM4C'} )
{
 print "<LI> $record{'ITEM4C'} </LI> \n" ;
}
print "</UL> \n" ;
print "<HR> \n" ;

#CHECK ANSWER #5
if ($answer5 eq $record{'SOL5'})   #right answer
{
 print "<P><BR> <FONT SIZE=+2> You're right! </FONT> <P>\n" ;
}
else 
{
 print "<P><BR> <FONT SIZE=+2> Your answer was: </FONT> \n" ;
 print "<FONT SIZE=+1> $answer5 </FONT> \n" ;
 print "<P> <FONT SIZE=+2> The correct answer is: </FONT> \n" ;
}

print "<BR> $record{'PARAGRAPH5'} \n" ;
print "<UL COMPACT=\"COMPACT\"> \n" ;
print "<LI> $record{'ITEM5A'} </LI> \n" ;
print "<LI> $record{'ITEM5B'} </LI> \n" ;
# PRINT THIRD LINE ONLY IF THIRD ITEM IS NON-EMPTY
if ( $record{'ITEM5C'} )
{
 print "<LI> $record{'ITEM5C'} </LI> \n" ;
}
print "</UL>  \n" ;


print "<CENTER> \n";
print "<H2>
<A HREF=\"$ktini{engine}?KEY=6060\"<B>Back To
Mid Atlantic States</B></A></H2></CENTER> \n";   
print "<!-- END OF CONTENT -->\n";


print "</TD>\n";
print "</TR>\n";
print "</TABLE>\n";
print "</CENTER>\n";

print "</BODY> \n" ;
print "</HTML> \n" ;

