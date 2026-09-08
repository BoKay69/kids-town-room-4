!#/usr/bin/perl

print <<END_OF_TEXT  


<HEAD>
<TITLE>KidsTown Township: Wonders - Taj Mahal</TITLE>
</HEAD>
<BODY BGCOLOR=SALMON>

<CENTER>
<TABLE BORDER=0 WIDTH=600>
<TR>
<TD ALIGN=CENTER> 
<IMG SRC="$ktini{townshipgraphics}/india1.gif" HEIGHT=100 WIDTH=150>
<BR>
<B>Map of India</B>
</TD>
<TD ALIGN=CENTER WIDTH=300>
<FONT SIZE=+3><B>Taj Mahal</B></FONT>
</TD>
<TD ALIGN=CENTER>
<IMG SRC="$ktini{townshipgraphics}/indflag.jpg" HEIGHT=100 WIDTH=150>
<BR>
<B>Flag of India</B></TD></FONT>
</TR>
</table>
</center>

<br>
<center>
<table border=0 width=600>
<tr>
<td align=center valign=top>
<IMG SRC="$ktini{townshipgraphics}/india3.gif" HEIGHT=250 WIDTH=150><br>
<b>River Ganges</b>
</td>
<td>
<B><FONT size=+1>The Taj Mahal is considered to be one of the
wonders of the world. The Taj Mahal was built by the Mughal Emperor
"Shah Jahan" in memory of his beloved "Mumtaz Mahal".
It took 20,000 craftsmen working around the clock for 22 years to
complete it.
It is truely one man's monumental testimony of love.
The Taj Mahal has become a landmark not only for the city of Agra,
but for the entire country of India.
</FONT></B>
</td>
<td align=center valign=top>
<IMG SRC="$ktini{townshipgraphics}/india4.gif" height=250 width=150>
<BR><B>Hindu Temple</B>
</TD>

</TR>
</TABLE>
<CENTER>

<BR>
<CENTER><FONT SIZE=+2>Game of Questions</FONT></CENTER>

<center>
<table border=1 width=600>

<form method="post" action="$ktini{engine}">
<input type=hidden name=KEY value=3007>
<input type=hidden name=file value=india.txt>
<tr>

<TD WIDTH=300 ALIGN=CENTER>
<FONT SIZE=+1><B>The Taj Mahal is located in: </B></FONT>
<BR>
<SELECT name=Q1>
<OPTION>Select one
<OPTION><B><FONT SIZE=+2>China<OPTION>India<OPTION>Tibet</FONT></B></SELECT>
</TD>

<TD WIDTH=300 ALIGN=CENTER>

<B><FONT SIZE=+1>The Taj Mahal was built by
<BR>
20,000 craftmen.</FONT></B>

<CENTER><B><FONT>
TRUE<INPUT type=radio name=Q2 value=on>
FALSE<INPUT type=radio name=Q2 value=off>
</FONT></B></CENTER>

</td>

</TR>
<TR>

<TD COLSPAN=2 ALIGN=CENTER>
<FONT SIZE=+1><B>The Taj Mahal was was a work of ____!<BR>
<SMALL>(Construct the word)</SMALL></B></FONT>
<BR>
<SELECT NAME=Q31><OPTION>
<OPTION value="F">F
<OPTION value="G">G
<OPTION value="H">H
<OPTION value="I">I
<OPTION value="J">J
<OPTION value="K">K
<OPTION value="L">L
</SELECT>  

<SELECT NAME=Q32><OPTION>
<option value="M">M
<option value="N">N
<option value="O">O
<option value="P">P
<option value="Q">Q
<option value="R">R
</SELECT>

<SELECT NAME=Q33><OPTION>
<OPTION value="R">R
<OPTION value="S">S
<OPTION value="T">T
<OPTION value="U">U
<OPTION value="V">V
<OPTION value="W">W
</SELECT>

<SELECT NAME=Q34><OPTION>
<OPTION value="A">A
<OPTION value="B">B
<OPTION value="C">C
<OPTION value="D">D
<OPTION value="E">E
<OPTION value="F">F
</SELECT> 
</center>

</FONT></B>
</TD>
<input type=hidden name=STRLEN value=4>
<input type=hidden name=RETURN value=3005>


</TR>

</TABLE>
<CENTER>
<BR>
<BR>
<CENTER><INPUT type=submit value="Click Here to Solve the Puzzle"></CENTER>
</FORM>

<BR><BR>

END_OF_TEXT
