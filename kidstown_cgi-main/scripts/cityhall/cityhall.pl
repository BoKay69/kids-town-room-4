#!/usr/bin/perl

print<<End_of_File;

<H2><CENTER>
<P>
<!-- FILL IN: OPENING PHRASE HERE IF NEEDED -->
<H2></H2>

<!--END OPENING PHRASE-->

<!--BEGIN CONTENT-->
<TABLE CELLSPACING=10><TR><TD VALIGN = "top">
<IMG ALIGN = "LEFT"  SRC="$ktini{cityhallgraphics}/main.gif" ALT = "Casebook Interactive Stories"><BR></TD><TD VALIGN = "top" ALIGN = "CENTER"><hr>
<FONT SIZE=6>W</FONT><FONT SIZE="4">elcome to City Hall!
Today you will be assisting the famous crime stopper Detective Anders.
You have two new cases to solve.
<P>
In each one, we need you to decide what to do next. Just click on
the underlined words at the end of each page and watch how the story unfolds!
</FONT>
<BR CLEAR=ALL>
<P>
Which case would you like to solve:
<P>
       <CENTER> <A HREF = "$ktini{engine}?KEY=5250">The Case of the Alien Photo</A><P>

or
<P>
        <A HREF = "$ktini{engine}?KEY=5010">The Bungled Bank Burglary</A><BR><P> 

<FONT SIZE=+1 COLOR="#cf0000">Good Luck!</FONT>
<P>
<HR>

<FONT SIZE="2"><B>Casebook Interactive Stories</B></FONT>
<BR>
</CENTER>
</TD></TR></TABLE>

<!--END CONTENT-->

<P></P>
</CENTER>
</TD>
</TR>

</TABLE>
</CENTER>

</BODY>
End_of_File
