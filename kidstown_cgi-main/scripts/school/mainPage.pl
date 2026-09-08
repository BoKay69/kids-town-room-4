#!/usr/bin/perl

print<<END_OF_TEXT
<HEAD>
<TITLE>KidsTown School</TITLE>
</HEAD>

<BODY BGCOLOR="#B0B0F" TEXT="BLACK" ALINK="RED" LINK="BLUE" VLINK="PURPLE">
<CENTER>
<B>
<FONT SIZE=+4>KidsTown School</FONT><BR>
</B>
<BR>
<IMG SRC="$ktini{'schoolgraphics'}/chalkboard.gif">
<BR>
<TABLE>
<TR><TD>
<B><FONT FACE="arial,helvetica" SIZE=+2>
<P>Welcome to school!</P>
<P>Current activities are:</Center></P>
</TD></TR>
<TR><TD>
<UL><H2>
<LI><A HREF="$ktini{engine}?KEY=4001">Word Fun</A>
<LI><A HREF="$ktini{engine}?KEY=4002">Scramble</A>
<LI><A HREF="$ktini{engine}?KEY=4500">Farm Field-Trip</A>
</H2></UL>
</TD></TR>
</TABLE>
<BR><BR>
<FONT SIZE=+1><B>Or visit one of these other KidsTown locations</B></FONT>
</CENTER>
<BR>
END_OF_TEXT
