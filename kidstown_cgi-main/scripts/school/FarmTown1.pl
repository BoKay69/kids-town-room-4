#!/usr/bin/perl
print<<endfile

<HEAD>
   <TITLE>KidsTown School: Farm Field-Trip: Start</TITLE>
</HEAD>
<BODY TEXT="#000000" BGCOLOR="#99FF99">

<CENTER>
<TABLE WIDTH=600 BORDER=0">
<TR><TD>

<H1 ALIGN=CENTER>KidsTown School: Field-Trip to a Farm</H1>

<HR>

<CENTER>
<P>
<B><FONT SIZE=+2>You have just arrived at Zeek's farm.</FONT></B>
</P>

<P>
<FONT SIZE=+2>Zeek lives on a farm in the country.
This is a picture of Zeek's farm.</FONT>
</P>

<P><IMG SRC="$ktini{schoolgraphics}/AZP00022.GIF" HEIGHT=200
WIDTH=200></P>
</CENTER>

<CENTER>
<TABLE CELLSPACING=2 CELLPADDING=2>
<TR>
<TD ALIGN=CENTER>
<FONT SIZE=+2>This is Farmer Zeek.</FONT>
<BR>
<img src="$ktini{schoolgraphics}/AZS00001.GIF" HEIGHT=200
WIDTH=206>
</TD>

<TD ALIGN=CENTER VALIGN=MIDDLE>
<FONT SIZE=+2>&quot;Hello!
Welcome to my farm!</FONT>

<P><FONT SIZE=+2>You can just call me Zeek.
<BR>
Let's get started on your tour!&quot;</FONT></P>
</TD>
</TR>
</TABLE>

<CENTER>
<P><FONT SIZE=+2><A HREF="$ktini{engine}?KEY=4510">Click here
to see the animals that live on Zeek's farm.</A>
</FONT></P>

<P><FONT SIZE=+2><A HREF="$ktini{engine}?KEY=4530">Click here
to see the different kinds of plants that Zeek grows.</A>
</FONT></P>
</CENTER>

<BR><BR>
<HR>

</TD></TR>
</TABLE>
</CENTER>

</BODY>

endfile
