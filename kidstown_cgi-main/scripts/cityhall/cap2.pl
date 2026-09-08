#!/usr/bin/perl

print<<End_of_File;

<H2><CENTER>
<P>
<!-- FILL IN: OPENING PHRASE HERE IF NEEDED -->
<H2></H2>

<!--END OPENING PHRASE-->

<!--BEGIN CONTENT-->
<TABLE BORDER ="0" WIDTH = "460" CELLSPACING = "10">
<TR><TD WIDTH = "268" ALIGN = "LEFT" VALIGN = "MIDDLE">
<font size = 6 font color="a00000">
"Actually, I'm amazed that nobody discovered this before," explains Maurice.
</FONT></TD><TD WIDTH = "200" ALIGN = "CENTER" VALIGN = "TOP">

<img src = "$ktini{cityhallgraphics}/cap2.gif">

<p></TD></TR>

<TR><TD COLSPAN = "2" WIDTH = "460"><FONT SIZE = "5">
"When I pointed my telescope at Venus last night I saw these little figures jumping around.  I thought I should take a picture of them."
<br><br>

You and Detective Anders exchange looks of skepticism.  Maurice Mole seems like the least likely person to spend his nights looking at the stars.  

</FONT></TD></TR></TABLE><p>
<TABLE BORDER ="0" WIDTH = "460" CELLSPACING = "2">
<TR><TD WIDTH = "100"><IMG  SRC="$ktini{cityhallgraphics}/same.gif"></TD><TD WIDTH = "360"><FONT SIZE = "4">
<hr>
Do you want to <A HREF="$ktini{engine}?KEY=5280"> continue questioning Maurice</A> or<A HREF="$ktini{engine}?KEY=5270"> send the photo to the crime lab?</A> 
<hr></FONT></TD></TR>
</TABLE>
<!--END CONTENT-->

<P></P>
</CENTER>
</TD>
</TR>

</TABLE>
</CENTER>

</BODY>
End_of_File

