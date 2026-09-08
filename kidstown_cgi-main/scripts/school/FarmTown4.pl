#!/usr/bin/perl
print<<endfile

<HEAD>
   <TITLE>KidsTown School: Farm Field-Trip: Crops</TITLE>
</HEAD>
<BODY TEXT="#000000" BGCOLOR="#99FF99">

<CENTER>
<TABLE WIDTH=600 BORDER=0">
<TR><TD>

<P ALIGN="CENTER"><FONT SIZE="5">Zeek grows many different
kinds of vegetables and grains in his fields.
<BR>
Some of the vegetables are <a href="$ktini{engine}?KEY=4541">corn</A>
and <a href="$ktini{engine}?KEY=4545">pumpkins</A>.
<BR>
Some of the grains are <a href="$ktini{engine}?KEY=4542">hay</A>
and <a href="$ktini{engine}?KEY=4544">wheat</A>.</FONT></P>

<BR><BR>

<P ALIGN="CENTER"><font size="5">Zeek grows many
different kinds of fruits in his orchards and vineyards.
<BR>
Some of the fruits are <a href="$ktini{engine}?KEY=4546">apples</A>,
<a href="$ktini{engine}?KEY=4547">oranges</A>
and <a href="$ktini{engine}?KEY=4548">grapes</A>.
</P>

<P ALIGN="CENTER"><IMG SRC="$ktini{schoolgraphics}/AZO00008.GIF"
width="225" height="274"></P>

<P ALIGN="CENTER"><FONT SIZE="5">After Zeek has gathered all
of the vegetables and fruits, he sells them to be sent to
grocery stores and supermarkets.</FONT></P>

endfile
