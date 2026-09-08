#!/usr/ucb/perl
#
# $Id: statepage.pl,v 2.3 1998/04/30 19:22:05 wmackey Exp $
#
# $Log: statepage.pl,v $
# Revision 2.3  1998/04/30  19:22:05  wmackey
# reverted activity link back to original form
#
# Revision 2.3  1998/04/30  19:22:05  wmackey
# reverted activity link back to original form
#
# Revision 2.2  1998/04/30  03:39:40  wmackey
# *** empty log message ***
#
#% Revision 2.1  1998/04/30  03:33:24  wmackey
#% added statename and state variables to activity link
#%
# Revision 2.3  1998/04/19  20:52:03  wmackey
# *** empty log message ***
#
# Revision 2.2  1998/04/19  20:17:31  wmackey
# modified to show return links to US and section maps
#
# Revision 2.1  1998/04/17  18:20:40  wmackey
# removed redundant display of state name - Will
#
# Revision 2.0  1998/03/12  21:17:57  jwgee
# baseline
#
# Revision 1.50  1997/05/01  18:00:00  jody
# Delivered as KT97
#
# Revision 1.8  1997/05/01  07:56:07  csc47391
# Changed background color.
#
# Revision 1.8  1997/05/01  05:17:16  mamollno
# corrected background color to comply with clients wishes.
#
# Revision 1.7  1997/04/28  08:19:57  csc47391
# Revised background color.
#
# Revision 1.6  1997/04/27  21:51:04  rglissma
# Changed wording for game.
#
# Revision 1.5  1997/04/26  21:38:13  rglissma
# Corrected nav bottom button placement, now should be centered.
#
# Revision 1.4  1997/04/26  21:27:50  rglissma
# modified background image, color, and link colors to be consistent with remainder of site.
#
# Revision 1.3  1997/04/26  06:45:18  csc47391
# Corrected navigation links and appearance.
#
# Revision 1.2  1997/04/26  06:31:10  csc47391
# Fixed return values from navtop and navbottom.
# Fixed HREF for help buttons.
#
#
# Initial Author: Khanh Tran, 04/18/1996
# Major Modification: Russell Glissmann, 04/23/97
# Creates individual state information pages using the state parameter and
# the b_state_datafile.txt.
#---------------------------------------------------------------------------
#---------------------------------------------------------------------------

# USE STEVE BRENNER'S cgi-lib.pl AND AARON SWANSON'S file-lib.pl LIBRARIES
require "$ktini{'libraryscripts'}/file-lib.pl" ;

sub ErrorPage
{
	print "<HTML> \n" ;
	print "<HEAD> \n" ;
	print "<TITLE>ERROR PAGE</TITLE> \n" ;
	print "</HEAD> \n" ;
	print "<BODY BGCOLOR=\"A2F9CD\" TEXT=#FF0023> \n" ;
	print "<H4> You have entered an invalid state number! </H4> \n" ;
	print "<H4> A valid state number has to be in the range from 1 to 51.</H4> \n";
	print "<BR><HR><BR> \n" ;
	print "<A HREF=\"$ktini{'engine'}?KEY=6000\"> Please click here to
return to the US Map Page </A> \n" ;
	print "</BODY> \n" ;
	print "</HTML> \n" ;
	exit if (1) ;
}



#Main section
$state_num = $ktvars{'state'} ;	#INPUT FROM MAP FILE
#$state_num=2;
# GENERATE A DEFAULT PAGE IF USER ENTERS AN INVALID STATE NUMBER 
if ($state_num<1 || $state_num>51) 
{
	print "<!-- IF HERE, THEN THERE IS INVALID INPUT -->\n";
	print &ErrorPage;
}

print "<!-- START OF MAIN -->\n";
#RETRIEVE STATE RECORD FROM DATA FILE
$record = &GetRecord("$ktini{'librarydata'}/b_state_datafile.txt",
$state_num) ;
print "<HEAD>\n";
print "<TITLE>KidsTown Geography: State Information Page</TITLE>\n";
print "</HEAD>\n";
print "<BODY BGCOLOR=\"#A2F9CD\" TEXT=BLACK VLINK=\"PURPLE\" ALINK=\"RED\"
LINK=\"BLUE\">\n" ;

print "<BR><BR>\n";

print "<!-- BEGIN OPENING PHRASE -->\n";
print "<CENTER> \n" ;
print "<TABLE  BORDER=0  WIDTH=100% > \n" ;
print "<TR> \n" ;
print "  <TD> \n" ;
print "  	<IMG SRC = \"$ktini{'librarygraphics'}/$record{'MAP'}\"
ALT=\"US Map\" ALIGN=middle> \n" ;
print "	 </TD>\n";	
$name = $record{'NAME'} ;   #RETRIEVE STATE NAME
$name =~ tr/a-z/A-Z/ ;   #UPPERCASE STATE NAME
print "  <TD ALIGN=CENTER> \n" ;
print "  	<FONT SIZE = +4><B><I>$name</I></B></font>\n";
print "	 </TD>";
print "  <TD ALIGN=RIGHT>\n";
print "   	<IMG SRC = \"$ktini{'librarygraphics'}/$record{'FLAG'}\"
ALT=\"US Flag\"BORDER=1 ALIGN=middle>\n";
print "	 </TD>\n";
print "</TR>\n";
print "</TABLE> \n" ;
print "</CENTER> \n" ;
print "<!-- END OF OPENING PHRASE -->\n";
print "<!-- BEGIN CONTENT -->\n";
print "<BR> \n" ;
print "<CENTER> \n" ;
print "<TABLE WIDTH=100%  BORDER=5  cellspacing=5  cellpadding=4> \n" ;

# IF THE RECORD IS OF WASHINGTON,D.C (RECORD #51) THEN GENERATE 
# A DIFFERENT WELCOME STATEMENT
if ($record{'RECORD'} eq '51') 
{
#	 print "<CAPTION> <H1> $record{'NAME'}! </H1>\n";
	 print "<CENTER><H2> Here are some interesting facts about </H2></CENTER>\n";
	 print "<CENTER><H2> the Capital of the United States: </H2></CENTER></CAPTION>\n" ;
}
else
{
#	print "<CAPTION> <H1> $record{'NAME'}!</H1>\n";
	print "<H2>Here are some interesting facts about $record{'NAME'}</H2></CAPTION>\n";
} 
 
print "<TR>\n" ;
print "	<TD> \n" ;
print " 	<IMG SRC=\"$ktini{'librarygraphics'}/building-i.gif\"
ALIGN=bottom WIDTH=40 HEIGHT=30 ALT=\"Building\"> \n" ; 
print "  	<FONT SIZE=+0> <B> Capital:  </B> $record{'CAPITAL'} </FONT> \n" ;
print "	</TD>\n";
print " <TD>\n" ;
print "   <IMG SRC=\"$ktini{'librarygraphics'}/flower-i.gif\"
ALIGN=bottom WIDTH=40 HEIGHT=30
ALT=\"Flower\"><FONT SIZE=+> <B> Flower:  </B> $record{'FLOWER'} </FONT> \n";
print "	</TD>\n";
print "</TR>\n";
print "<TR>\n";
print "	<TD>\n" ;
print "		<IMG SRC=\"$ktini{'librarygraphics'}/date-i.gif\"
ALIGN=bottom WIDTH=40
HEIGHT=30  ALT=\"Paper\"><FONT SIZE=+> <B> Induction Date:  </B> $record{'ADMITTED'} </FONT>\n" ;
print "	</TD>\n";
print "	<TD>\n";
print "		<IMG SRC=\"$ktini{'librarygraphics'}/bird-i.gif\"
ALIGN=bottom WIDTH=40
HEIGHT=30  ALT=\"Bird\"><FONT SIZE=+> <B> Bird:  </B> $record{'BIRD'} </FONT> \n" ;
print "	</TD>\n";
print "</TR>\n";
print "<TR>\n";
print "	<TD>\n" ;
print "		<IMG SRC=\"$ktini{'librarygraphics'}/order-i.gif\"
ALIGN=bottom WIDTH=40
HEIGHT=30  ALT=\"Numbers\"><FONT SIZE=+> <B> Order of Induction:  </B> $record{'ORDER'} </FONT> \n" ;
print "	</TD>\n";
print "	<TD>\n";
print "		<IMG SRC=\"$ktini{'librarygraphics'}/tree-i.gif\"
ALIGN=bottom WIDTH=40
HEIGHT=30  ALT=\"Tree\"><FONT SIZE=+> <B> Tree:  </B> $record{'TREE'} </FONT> \n" ;
print "	</TD>\n";
print "</TR>\n";
print "<TR> \n" ;
print "	<TD> \n" ;
print "		<IMG SRC=\"$ktini{'librarygraphics'}/redball-i.gif\"
ALIGN=bottom WIDTH=40
HEIGHT=30  ALT=\"Red Ball\"><FONT SIZE=+> <B> Nickname:  </B> $record{'NICKNAME'} </FONT> \n" ;
print "	</TD>\n";
print " <TD>\n" ;
print "		<IMG SRC=\"$ktini{'librarygraphics'}/music-i.gif\"
ALIGN=bottom WIDTH=40
HEIGHT=30  ALT=\"Music Notes\"><FONT SIZE=+> <B> Song:  </B> <I> $record{'SONG'} </I> </FONT> \n" ;
print "</TABLE> \n" ;
print "</CENTER> \n" ;

print "<CENTER> \n" ;
print "<TABLE  BORDER=0  WIDTH=600  CELLPADDING=10 > \n" ;
print "<TR> \n" ;
print "	<TD   COLSPAN=3  ALIGN=CENTER> \n" ;
# POINT TO AN ACTIVITY ONLY IF THERE'S ONE IN THE DATA FILE
if ( $record{'ACTIVITY'} )
{
	print "		<A HREF=\"$ktini{'engine'}?KEY=$record{'ACTIVITY'}\">\n";
	print "		<IMG SRC=\"$ktini{'librarygraphics'}/school-i.gif\"
ALIGN=middle WIDTH=70 HEIGHT=70  ALT=\"Children\">\n";
	print "		<FONT SIZE=+2> Click here to play a game! </FONT></A> \n" ;
	print "	</TD>\n";
 	print " </TR> \n" ;
}
print "</TABLE> \n" ;
print "</CENTER> \n" ;
print "<CENTER> \n";
print "<TABLE BORDER=0 WIDTH=600 > \n";
print "<TR> \n";
print "<TD> \n";
print "<A HREF=\"$ktini{'engine'}?KEY=6000\">Return to USA map</A> \n";
print "</TD> \n";
# link to return back to section map
if ($record{'LOCATION'})
{
  print "<TD> \n"; 
  print "<A HREF=\"$ktini{'engine'}?KEY=$record{'RETURN'}\">Return to 
$record{'LOCATION'} states map</A> \n";
}
print "</TABLE> \n";
print "</CENTER> \n";
print "<!-- END OF CONTENT -->\n";
print "</TD>\n";
print "</TR>\n";
print "</TABLE>\n";
print "</CENTER>\n";
print "<!-- END OF MAIN -->\n";
