#!/usr/ucb/perl

print<<END_OF_TEXT;
<HEAD>
<TITLE>Library - New England states</TITLE>
</HEAD>
<BODY TEXT="#000000" LINK="#0000ff" VLINK="#551a8b" ALINK="#ff0000" BGCOLOR="#A2F9CD">
<H1 ALIGN="CENTER">Welcome to the New England states!</H1>
<BR>To learn more about our states, click on each one and see what
happens!<BR>
<MAP NAME="NewEngland">
  <AREA SHAPE=POLY COORDS="80,119,96,85,96,37,106,17,116,21,132,14,143,13,156,
25,165,49,165,71,177,74,183,89,191,93,195,89,199,93,203,104,180,131,173,133,
167,141,159,136,156,142,150,142,151,155,136,166,131,160,125,174,120,176,119,
206,110,208,98,194,97,173,88,160,81,134" 
HREF="$ktini{'engine'}?KEY=6100&state=19">
  <AREA SHAPE=POLY COORDS="35,243,34,207,25,202,15,150,41,143,69,130,70,147,
76,154,60,169,59,235" HREF="$ktini{'engine'}?KEY=6100&state=45">
  <AREA SHAPE=POLY COORDS="59,169,75,154,69,145,69,126,78,120,84,149,92,169,
98,175,99,195,116,211,116,218,98,227,82,228,73,233,58,232" 
HREF="$ktini{'engine'}?KEY=6100&state=29">
  <AREA SHAPE=POLY COORDS="34,270,36,243,82,229,100,228,117,216,117,224,122,
228,114,237,113,244,128,247,136,256,143,256,153,246,155,252,153,256,160,266,
156,272,150,267,146,272,143,267,135,266,132,271,128,266,123,270,116,270,102,
257,95,259,79,267,50,268,45,271" 
HREF="$ktini{'engine'}?KEY=6100&state=21">
  <AREA SHAPE=POLY COORDS="45,309,37,273,51,267,84,267,80,276,79,297,61,308" 
HREF="$ktini{'engine'}?KEY=6100&state=7">
  <AREA SHAPE=POLY COORDS="80,294,80,274,85,262,92,262,98,271,99,293,93,295" 
HREF="$ktini{'engine'}?KEY=6100&state=39">
</MAP>
<TABLE BORDER=0 WIDTH=600 CELLPADDING=3>
<TR>
<TD>
<img src="$ktini{'librarygraphics'}/NewEngland.GIF" WIDTH=300 HEIGHT=333
BORDER=0
USEMAP="#NewEngland">
<TD>
<A HREF="$ktini{'engine'}?KEY=6100&state=7">Connecticut (CT)</A><BR>
<A HREF="$ktini{'engine'}?KEY=6100&state=19">Maine (ME)</A><BR>
<A HREF="$ktini{'engine'}?KEY=6100&state=21">Massachusettes (MA)</A><BR>
<A HREF="$ktini{'engine'}?KEY=6100&state=29">New Hampshire (NH)</A><BR>
<A HREF="$ktini{'engine'}?KEY=6100&state=39">Rhode Island (RI)</A><BR>
<A HREF="$ktini{'engine'}?KEY=6100&state=45">Vermont (VT)</A><BR>
<TR>
<TD ALIGN="CENTER">
<A HREF="$ktini{'engine'}?KEY=6000">Return to USA map</A>
</TABLE>
</BODY>
END_OF_TEXT
