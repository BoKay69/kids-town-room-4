#!/usr/ucb/perl
#Filename:  b_wi_tale.cgi
#
#This program accepts WWW form input & produces a story based on the inputs
#
#This program uses Steve Brenner's cgi-lib.pl library to handle the input
#----------------------------------------------------------------------------


#require "cgi-lib.pl" ;


#&ReadParse ;

#print &PrintHeader ;

print "<HTML> \n" ;
print "<HEAD> \n" ;
print "<TITLE>KidsTown Geography:Wacky Web Tale: Answers Wisconsin</TITLE> \n" ;
print "<BODY BGCOLOR=\"A2F9CD\" TEXT=BLACK VLINK=\"PURPLE\" ALINK=\"RED\" LINK=\"BLUE\"> \n" ;
print "</HEAD> \n" ;
print "<BODY> \n" ;

print "<!-- BEGIN OPENING PHRASE -->";
print "<CENTER> \n" ;
print "<TABLE BORDER=0 WIDTH=100%> \n" ;
print " <TR> \n" ;
print "   <TD> <IMG SRC=\"$ktini{librarygraphics}/b_wi_map.gif\"
            ALIGN=\"MIDDLE\" \n" ;
print "   <TD> <EM> <FONT SIZE=+5 COLOR=#00bb01>
		Wisconsin  </FONT> </EM> \n" ; 
print "</TABLE> \n" ;
print "</CENTER> \n" ;


print "<BR><BR> \n" ;
print "<center> \n" ;
print "<IMG width=100%   SRC=\"$ktini{librarygraphics}/bead-line.gif\"
        ALT=\"Line\"> \n" ;
print "</center> \n" ;
print "<BR> <BR> \n" ;

print "<H3>The following are brief paragraphs that will tell you a little more
       about the choices you made.  Read through them and try to
       imagine how the sentences would have sounded with the other selections,
       or just go back and try a different word.</H3> \n" ;

# START GENERATING THE STORY USING INPUT FROM FRONT-END FORM IN
# "b_wi_tale.html"

print "<P><BR>When <B>$ktvars{'name'}</B> and other children visit
Wisconsin, they
can learn all about the glaciers that once covered most of the state.
Because
of the glaciers, most of Wisconsin is flat and has very fertile soil.
Many 
crops like <B>$ktvars{'favorite'}</B>, corn, and cranberries are grown on these 
lands today.  But Wisconsin is most famous for its dairy farming. 
Wisconsin produces more milk and dairy products than any other state.</P> \n" ;

print "<HR> \n" ;
print "<P><BR>The very first people to live in Wisconsin were the Native 
Indians.  Tribes like the <B>$ktvars{'native'}</B>, Fox, Sauk, and Kickapoo 
settled in Wisconsin after the Ice Age.  Some Native Americans built large 
burial mounds shaped like animals.  When Europeans first came to
Wisconsin, 
they were friends with the Native people. They traded furs and other goods 
with them.  Through wars and diseases many Native people have died.  Today,
most Native Americans live on reservations.</P> \n" ; 

print "<HR> \n" ;

print "<P><BR>Many famous indivduals were born in Wisconsin.  One name that
<B>$in{'name'}</B> might be familiar with is Oshkosh.  Oshkosh was a famous
Menominee Indian leader who successfully kept his tribal lands.  There is a 
city named after him, Oshkosh.  Are you still unfamiliar with his name?
Well, have you heard
of Oshkosh clothes for kids?  <B>$ktvars{'name'}</B> might have read some books, 
or seen a television show about another famous Wisconsinite, Laura
Ingalls 
Wilder, who was born in Pepin, Wisconsin. She wrote the <i>Little House
on the 
Prairie </i>books, which later became a television series.</P>   \n" ;


print "<BR><BR> \n" ;
print "<center> \n" ;
print "<IMG width=100%   SRC=\"$ktini{librarygraphics}/bead-line.gif\"
        ALT=\"Line\"> \n" ;
print "</center> \n" ;
print "<BR> <BR> \n" ;

print "<CENTER> \n";
print "<H2><A
HREF=\"$ktini{engine}?KEY=6300&statename=Wisconsin&state=49\"<B>Back To Web
Tale</B></A></H2> \n";
print "</CENTER> \n";


print "</TD>\n";
print "</TR>\n";
print "</TABLE>\n";
print "</CENTER>\n";

print "</BODY> \n" ;
print "</HTML> \n" ;

