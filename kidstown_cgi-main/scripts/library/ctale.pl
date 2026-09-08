#!/usr/ucb/perl
#Filename:  b_ct_tale.cgi
#
#This program accepts WWW form input & produces a story based on the inputs
#
#This program uses Steve Brenner's cgi-lib.pl library to handle the input
#----------------------------------------------------------------------------


print "<HTML> \n" ;
print "<HEAD> \n" ;
print "<TITLE>KidsTown Geography: Wacky Web Tale: Answers Connecticut</TITLE> \n" ;
print "</HEAD> \n" ;
print "<BODY BGCOLOR=\"A2F9CD\" TEXT=BLACK VLINK=PURPLE ALINK=RED LINK=BLUE> \n" ;

print "<!-- BEGIN OPENING PHRASE -->\n";
print "<CENTER> \n" ;
print "<TABLE BORDER=0 WIDTH=100%> \n" ;
print " <TR> \n" ;
print "   <TD> <IMG SRC=\"$ktini{librarygraphics}/b_ct_map.gif\"
            ALIGN=\"MIDDLE\" \n" ;
print "   <TD> <EM> <FONT SIZE=+5 COLOR=#ff3600>
		Connecticut  </FONT> </EM> \n" ; 
print "</TABLE> \n" ;
print "</CENTER> \n" ;

print "<BR><BR> \n" ;
print "<center> \n" ;
print "<IMG width=100%   SRC=\"$ktini{librarygraphics}/forest-line.gif\"
        ALT=\"Line\"> \n" ;
print "</center> \n" ;
print "<BR> <BR> \n" ;

print "<!-- END OPENING PHRASE -->\n";

print "<!-- BEGIN CONTENT -->\n";
print "<H3>The following are brief paragraphs that will tell you a little more
       about the choices you made.  Read through them and try to
       imagine how the sentences would have sounded with the other selections,
       or just go back and try a different word.</H3> \n" ;
print "<HR> \n" ;
print "<P> \n" ;
print "<B>$ktvars{'tribes'}</B> Native Indian tribes such as the Niantic, Podunk, 
       Qunnipiac, and Pequot are native to the area of Connecticut.  
       As in most regions of our country, Native Americans were killed to 
       provide land and resources for the European settlers.   
       <B>$ktvars{'tribes'}</B> Indians were killed by the diseases they caught
       from the Europeans.  Today, the remaining tribes live on reservations
       established by the European settlers and American government.</P> \n" ;
print "<HR> \n" ;
print "<P>Connecticut is so <B>$ktvars{'animals'}</B> that it could fit within 
       Alasaka more than 117 times.  Even though Connecticut is a 
       <B>$ktvars{'animals'}</B> state compared to other states, it has a large
       population.  With so many people living in such a <B>$ktvars{'animals'}</B>
       area most large animals such as bears and panthers have been pushed out
       of the state.  Many <B>$ktvars{'animals'}</B>  animals still live in
       Connecticut, like rabbits, minks, and squirrels.</P> \n" ;
print "<HR> \n" ;
print "<P>In the 1800s Connecticut had a <B>$ktvars{'pollution'}</B>.
There
       was a shortage of fertile land and an abundance of water.  So,
Connecticut
       became a very industrialized state with lots of textile mills and 
       factories.  All of these industries dumped many pollutants into the
       waters of Connecticut.  This caused a new <B>$ktvars{'pollution'}</B>
       of water pollution.  Pollution from chemicals, sewage and spills has 
       caused many fish and other creatures to die.  To fix the 
       <B>$ktvars{'pollution'}</B>, Connecticut has written many laws concerning
       what can be put into its rivers.  There are many things that you
can
       do to help solve the <B>$ktvars{'pollution'}</B> of water pollution. 
       Turning the water off while brushing your teeth saves precious water.
       You can also save water by taking quick showers instead of bathing.
With
       everyone working together, we can save one of our most precious 
       resources, <B>water!</B></P> \n" ;

print "<BR><BR> \n" ;
print "<center> \n" ;
print "<IMG width=100%   SRC=\"$ktini{librarygraphics}/forest-line.gif\"
        ALT=\"Line\"> \n" ;
print "</center> \n" ;
print "<BR> <BR> \n" ;
print "<!-- END OF CONTENT -->\n";

print "<CENTER> \n";
print "<H2><A
HREF=\"$ktini{engine}?KEY=6700&statename=Connecticut&state=7\"<B>Back To
Web
Tale</B></A></H2> \n";
print "</CENTER> \n";   

print "</TD>\n";
print "</TR>\n";
print "</TABLE>\n";
print "</CENTER>\n";

print "</BODY>\n";
print "</HTML> \n" ;
