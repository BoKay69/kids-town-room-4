#!/usr/bin/perl
print <<END_OF_TEXT;

<TABLE BORDER="0" ALIGN="DEFAULT" WIDTH="100%">
<TR>
<TD ALIGN="LEFT" VALIGN="TOP"></TD>
<TH ALIGN="LEFT" VALIGN="TOP">
<P ALIGN="center"><FONT SIZE="+2"><I>What Country Is This?</I></FONT><I><FONT SIZE="3"></FONT></I></P>
</TH>
<TD ALIGN="LEFT" VALIGN="TOP">
<P ALIGN="center">&nbsp;</P>
</TD>
</TR>
<TR>
<TD ALIGN="LEFT" VALIGN="MIDDLE" WIDTH="25%">
<P ALIGN="left"><A HREF="$ktini{engine}?KEY=3010"><IMG BORDER="0"
SRC="$ktini{townshipgraphics}/clue1.jpg" WIDTH="100" HEIGHT="35"
ALIGN="TEXTTOP"></A></P>
<P ALIGN="left"><A HREF="$ktini{engine}?KEY=3012"><IMG BORDER="0"
SRC="$ktini{townshipgraphics}/Clue2.jpg" WIDTH="100" HEIGHT="35"></A></P>
<P ALIGN="left"><FONT COLOR="#FF0080"><B>This country takes up an entire continent.</B></FONT></P>
</TD>
<TD ALIGN="LEFT" VALIGN="TOP">
<P ALIGN="center"><IMG BORDER="0"
SRC="$ktini{townshipgraphics}/match_co.gif"></P>
</TD>
<TD ALIGN="LEFT" VALIGN="TOP">
<P ALIGN="left">&nbsp;</P>
<P ALIGN="left"><FONT SIZE="+1"><A HREF="$ktini{engine}?KEY=3016"><B>A.
France</B></A></FONT></P>
<P ALIGN="left"><FONT SIZE="+1"><B><A HREF="$ktini{engine}?KEY=3018">B.
Australia</A></B></FONT></P>
<P ALIGN="left"><A HREF="$ktini{engine}?KEY=3020"><B><FONT SIZE="+1">C.
Japan</FONT></B></A></P>
</TD>
</TR>
</TABLE>

<BR><BR><BR>
<DIV ALIGN=CENTER>
<B><A HREF="$ktini{engine}?KEY=3022">I've already done this set of
countries.
Skip to the next one!</A><B></DIV>

END_OF_TEXT
