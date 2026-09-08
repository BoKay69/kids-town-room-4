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
<font size = 6 font color="22ac2f">
"Thank you both for coming," the bank manager says as he escorts you toward his office. "Last night we 
were nearly robbed."

</FONT></TD><TD WIDTH = "200" ALIGN = "CENTER" VALIGN = "TOP">

<img src = "$ktini{cityhallgraphics}/bbb1.gif">

<p></TD></TR>

<TR><TD COLSPAN = "2" WIDTH = "460"><FONT SIZE = "5">

"Nearly?" questions Detective Anders.
<br><br>
"Well, thanks to quick action by our night security guard, Willy Sparks, nothing was stolen.  I figured 
you may be able to find some clues that will lead us to the culprit so he won't strike again.  Feel free to 
examine the vault and interview Willy."

</FONT></TD></TR></TABLE><p>
<TABLE BORDER ="0" WIDTH = "460" CELLSPACING = "2">
<TR><TD WIDTH = "100"><IMG  SRC="$ktini{cityhallgraphics}/same.gif"></TD><TD WIDTH = "360"><FONT SIZE = "4">
<HR>
Do you want to<A HREF="$ktini{engine}?KEY=5210"> examine the vault</A> or<A HREF="$ktini{engine}?KEY=5020"> question Willy?</A> 
 
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




