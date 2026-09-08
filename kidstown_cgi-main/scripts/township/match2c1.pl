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
<P ALIGN="left"><B><FONT COLOR="#FF0080">This country is in Europe.</FONT></B></P>
<P ALIGN="left"><A HREF="$ktini{engine}?KEY=3026"><IMG BORDER="0"
SRC="$ktini{townshipgraphics}/Clue2.jpg" WIDTH="100" HEIGHT="35"></A></P>
<P ALIGN="left"><A HREF="$ktini{engine}?KEY=3028"><IMG BORDER="0"
SRC="$ktini{townshipgraphics}/clue3.jpg" WIDTH="100" HEIGHT="35"></A></P>
</TD>
<TD ALIGN="LEFT" VALIGN="TOP">
<P ALIGN="center"><IMG BORDER="0"
SRC="$ktini{townshipgraphics}/match2.gif"></P>
</TD>
<TD ALIGN="LEFT" VALIGN="TOP">
<P ALIGN="left">&nbsp;</P>
<P ALIGN="left">&nbsp;</P>
<P ALIGN="left"><A HREF="$ktini{engine}?KEY=3062"><FONT SIZE="+1"><B>A.
Finland</B></FONT></A></P>
<P ALIGN="left"><FONT SIZE="+1"><A HREF="$ktini{engine}?KEY=3064"><B>B.
Egypt</B></A></FONT></P>
<P ALIGN="left"><A HREF="$ktini{engine}?KEY=3066"><FONT SIZE="+1"><B>C.
Jamaica</B></FONT></A></P>
</TD>
</TR>
</TABLE>
<BR><BR><BR>
<DIV ALIGN=CENTER>
<B><A HREF="$ktini{engine}?KEY=3030">I've already done this set of
countries. Skip to the next one!</A></B></DIV>

END_OF_TEXT
