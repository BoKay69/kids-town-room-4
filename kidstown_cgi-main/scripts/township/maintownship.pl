!#/usr/bin/perl

print <<END_OF_TEXT  

<HEAD><TITLE>Kidstown Township</TITLE></HEAD>
<BODY BGCOLOR="#99CCFF">

<CENTER>
<TABLE WIDTH=600" BORDER=0>
<TR><TD>
<CENTER>
<FONT SIZE=+3>
<B>Welcome Aboard the TownShip</B>
</FONT>
<BR>
<BR>
<IMG SRC="$ktini{townshipgraphics}/TownShip.gif">
<BR>
<BR>
<FONT SIZE=+2><B>Sail to One of These Wonders of the World</B></FONT>
<BR>
<FONT SIZE=+3>
<A HREF="$ktini{engine}?KEY=3001">Statue of Zeus</A>
<BR>
<A HREF="$ktini{engine}?KEY=3003">Pyramids of Giza</A>
<BR>
<A HREF="$ktini{engine}?KEY=3004">Great Wall of China</A>
<BR>
<A HREF="$ktini{engine}?KEY=3005">Taj Mahal</A>
</FONT>
<BR>
<BR>
<FONT SIZE=+2><B>Identify Countries By Their Outlines</B></FONT>
<BR>
<FONT SIZE=+3><A HREF="$ktini{engine}?KEY=3008">Country Shape Game</A></FONT>
<BR>
<BR>

</TD>
</TR>
</TABLE>
</CENTER>

END_OF_TEXT
