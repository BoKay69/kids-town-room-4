#!/usr/bin/perl
print<<_END_OF_TEXT_
<HEAD>
  <TITLE>KidsTown Museum</TITLE>
</HEAD>

<BODY BGCOLOR="#EEE2B4" TEXT="BLACK" ALINK="RED" LINK="BLUE" VLINK="PURPLE">

<DIV ALIGN="CENTER">
<B>
<FONT SIZE=+4>KidsTown Museum</FONT><BR>
<FONT SIZE=+2>Open to the Public</FONT>
</B>
</DIV>

<Center><IMG SRC="$ktini{museumgraphics}/museum.gif"></center>

<BR CLEAR="ALL">

<BLOCKQUOTE>
<CENTER>
<B><FONT FACE="arial,helvetica" SIZE=+2>
<P>Welcome to the museum!</P>
<P>The current exhibit: 
<A HREF="$ktini{engine}?KEY=8010">The Color Exhibition</A>
</P>
<P>The Planetarium show:
<A HREF="$ktini{engine}?KEY=8550">Our Solar System</A></P>
<BR><BR>
<P><I>Or visit other KidsTown activities</P></I>
</CENTER>
</BLOCKQUOTE>
_END_OF_TEXT_

