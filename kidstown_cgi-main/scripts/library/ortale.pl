#!/usr/ucb/perl
#Filename:  b_or_tale.cgi
#
#This program accepts WWW form input & produces a story based on the inputs
#
#This program uses Steve Brenner's cgi-lib.pl library to handle the input
#----------------------------------------------------------------------------






print "<HTML> \n" ;
print "<HEAD> \n" ;
print "<TITLE>KidsTown Geography: Wacky Web Tale: Answers Oregon</TITLE> \n" ;
print "<BODY BGCOLOR=\"A2F9CD\" TEXT=BLACK VLINK=\"PURPLE\" ALINK=\"RED\" LINK=\"BLUE\"> \n" ;
print "</HEAD> \n" ;
print "<BODY> \n" ;


print "<CENTER> \n" ;
print "<TABLE BORDER=0 WIDTH=100%> \n" ;
print " <TR> \n" ;
print "   <TD> <IMG SRC=\"$ktini{librarygraphics}/b_or_map.gif\"
            ALIGN=\"MIDDLE\" \n" ;
print "   <TD> <EM> <FONT SIZE=+5 COLOR=#8812A4>
		Oregon  </FONT> </EM> \n" ; 
print "</TABLE> \n" ;
print "</CENTER> \n" ;

print "<BR><BR> \n" ;
print "<center> \n" ;
print "<IMG width=100%   SRC=\"$ktini{librarygraphics}/sun-line.gif\"
        ALT=\"Line\"> \n" ;
print "</center> \n" ;
print "<BR> <BR> \n" ;

print "<H3>The following are brief paragraphs that will tell you a little more
       about the choices you made.  Read through them and try to
       imagine how the sentences would have sounded with the other selections,
       or just go back and try a different word.</H3> \n" ;
print "<HR> \n" ;
print "<P>Oregon is bordered on three side by Washington, Idaho, Nevada and
       California.  The very <B> $ktvars{'trees'} </B> Pacific Ocean borders 
       Oregon on the west side of the state.  The Columbia River is 7 miles 
       wide where it empties into the Pacific Ocean.  It is so
<B>$ktvars{'trees'}</B>,
       in fact, that <B> $ktvars{'trees'} </B> oceangoing ships can travel
up the river for 200 miles.  The <B> $ktvars{'trees'} </B> Crater Lake is
the deepest lake in the United States.  It's located in an extinct
volcano,Mount Mazama.</P> \n" ;
print "<HR> \n" ;
print "<P>In 1971 Oregon became the first state to require that beverage cans
       and bottles be returnable.  Now all of Oregon's <B> $ktvars{'recycle'}
</B>        participate in the recycling program.</P> \n" ;
print "<HR> \n" ;
print "<P>In a process called clear-cutting, many of Oregon's 
       <B> $ktvars{'forest'} </B> forests have disappeared.  Many 
       <B> $ktvars{'forest'} </B> trees were between 200 and 1,200 years old. \n" ;
print "Many animals and birds are endangered by the removal of these trees.
       Oregon is now requiring smarter ways to remove trees.  In the
future 
       Oregon hopes to have many <B> $ktvars{'forest'} </B> forests again.
       </P> \n" ;


print "<BR><BR> \n" ;
print "<center> \n" ;
print "<IMG width=100%   SRC=\"$ktini{librarygraphics}/sun-line.gif\"
        ALT=\"Line\"> \n" ;
print "</center> \n" ;
print "<BR> <BR> \n" ;

print "<CENTER> \n";
print "<H2><A
HREF=\"$ktini{engine}?KEY=6500&statename=Oregon&state=37\"<B>Back To
Web
Tale</B></A></H2> \n";
print "</CENTER> \n";   

print "<!-- END OF CONTENT -->\n";

print "</TD>\n";
print "</TR>\n";
print "</TABLE\n";

print "</BODY>\n";
print "</HTML> \n" ;
