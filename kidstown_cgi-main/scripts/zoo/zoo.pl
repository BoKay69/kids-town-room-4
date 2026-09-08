#!/usr/bin/perl

print <<hereDocument;

<!--BEGIN CONTENT-->
<CENTER>
<TABLE BORDER=0 WIDTH="600">
<TR>
<TD>
<BR>
<CENTER>
<img src="$ktini{zoographics}/zoo.gif" alt=Zoo width=500 height=200>
</CENTER>


<BR>

<H2>
<P>
<CENTER>
Animals in this zoo are grouped together by where they live.
<BR>
Select one of the locations below to see some of the animals
that live there.
</CENTER>
</H2>

<BR>
<CENTER>
 <A HREF="$ktini{engine}?KEY=9500">
  <FONT SIZE="4">
   <STRONG>
    See these regions on the world map.
   </STRONG>
  </FONT>
 </A>
</CENTER>
<BR>
</TABLE>
</CENTER>

<!--END CONTENT-->

hereDocument
