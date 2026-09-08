#!/usr/bin/perl

print <<END_OF_TEXT  



<HEAD>
<TITLE>KidsTown Township: Wonders - Statue of Zeus</TITLE>
</HEAD>
<BODY BGCOLOR=LIGHTBLUE>

<CENTER>
<TABLE BORDER=0 WIDTH=600>
<tr>
<td align=center>
<IMG SRC="$ktini{townshipgraphics}/mapgr.jpg" HEIGHT=100 WIDTH=150><br><b>
Map of Greece</b>
</td>
<td align=center>
<font size=+4><b> 
Zeus of Olympia</b>
</td>
<td align=center>
<IMG SRC="$ktini{townshipgraphics}/flaggr.gif" HEIGHT=100 WIDTH=150><br><b>
Flag of Greece</b>
</td>
</tr>
</table>
</font></H1></CENTER>

<center>
<table border=0 width=600>
<center>
<tr>
<td align=center valign=top>
<IMG SRC="$ktini{townshipgraphics}/greece4.gif" HEIGHT=250 WIDTH=125>
<br><b>Parthenon</b>
</td>
<td>
<b>
<font size=+1>
The statue of Zeus was built in the honor of the god who the Ancient 
Olympic games were held for. It was located in the ancient town that gave its
name to the Olympics, the ancient town of Olympia in Greece. The
ancient Greek calender starts in 776 BCE.  The Olympic games are
believed to have started that year. The temple of Zeus in Olympia was
designed by the architect Libon and was built around 420 BCE. The
statue was placed inside the temple about 15 to 20 years later when its
creator, Pheidias, finished sculpting it.  The statue represents the god of ancient world,
Zeus, sitting and holding a staff made from ivory and gold.
The whole statue was made from gold, and it was as tall as a
modern four-story building. During the Olympic games, even wars stopped
allowing athletes from Syria, Egypt, and Sicily to celebrate the
Olympics and to worship their king of gods: Zeus. 
</FONT></B>
</td>
<td align=center valign=top>
<IMG SRC="$ktini{townshipgraphics}/greece7.gif" height=250 width=125>
<br><b>Statue of Aphrodite</b>
</td>

</tr>
</center>
</table>
</center>
<br>

<center>
<table border=0 width=600>
<tr><td align=center><b><font size=+2>Game of Questions</b></td></tr>
</table>
</center>

<CENTER>
<TABLE BORDER=1 WIDTH=600>
<FORM METHOD="POST" ACTION="$ktini{engine}">
<INPUT TYPE=HIDDEN NAME=KEY VALUE=3007>
<INPUT TYPE=HIDDEN NAME=file VALUE=zeus.txt>

<TR>

<TD WIDTH=300 ALIGN=CENTER>
<FONT SIZE=+1>
<B>The statue of Zeus was built around the year</B></FONT>
<CENTER><SELECT name=Q1></CENTER>
<CENTER><OPTION>Select One
<OPTION value="500 CE">500 CE
<OPTION value="300 BCE">300 BCE
<OPTION value="420 BC">420 BCE
</FONT></U></B></SELECT></CENTER>
</TD>

<TD ALIGN=CENTER WIDTH=300>
<FONT SIZE=+1><B>Does the statue still exist?</B></FONT></B>
<CENTER><FONT SIZE=+2>
Yes<INPUT TYPE=RADIO NAME=Q2 VALUE=on> 
No<INPUT TYPE=RADIO NAME=Q2 VALUE=off>
</FONT></CENTER>
</TD>

</TR>
<TR>
<TD COLSPAN=2 ALIGN=CENTER>

<BR><B><FONT SIZE=+1>In which town was the statue located?
(Construct the word)</FONT></B>

<CENTER><SELECT NAME=Q31><OPTION></CENTER>
<option value="M">M
<option value="N">N
<option value="O">O
<option value="P">P
<option value="Q">Q
<option value="R">R
<option value="S">S         
</SELECT>


<SELECT NAME=Q32><OPTION>
<OPTION value="K">K
<OPTION value="L">L
<OPTION value="M">M
<OPTION value="N">N
<OPTION value="O">O
<OPTION value="P">P
<OPTION value="Q">Q
</SELECT>


<SELECT NAME=Q33><OPTION>
<option value="U">U
<option value="V">V
<OPTION value="W">W
<OPTION value="X">X
<OPTION value="Y">Y
<OPTION value="Z">Z
</select>


<SELECT NAME=Q34><OPTION>
<OPTION value="K">K
<OPTION value="L">L
<OPTION value="M">M
<OPTION value="N">N
<OPTION value="O">O
<OPTION value="P">P   
</select>

<SELECT NAME=Q35><OPTION>
<OPTION value="K">K
<OPTION value="L">L
<OPTION value="M">M
<OPTION value="N">N
<OPTION value="O">O
<OPTION value="P">P
<OPTION value="Q">Q   
</select>

<SELECT NAME=Q36><OPTION>
<OPTION value="F">F
<OPTION value="G">G
<OPTION value="H">H
<OPTION value="I">I
<OPTION value="J">J
<OPTION value="K">K
<OPTION value="L">L
</SELECT>


<SELECT NAME=Q37><OPTION>
<OPTION value="A">A
<OPTION value="B">B
<OPTION value="C">C
<OPTION value="D">D
<OPTION value="E">E
<OPTION value="F">F
<OPTION value="G">G
</SELECT>

</FONT>
<INPUT TYPE=HIDDEN NAME=STRLEN VALUE=7>
<INPUT TYPE=HIDDEN NAME=RETURN VALUE=3001>
<BR>
<BR>
</TD>

</TR>

</TABLE>
<CENTER>
<BR>
<BR>
<CENTER><INPUT TYPE=SUBMIT VALUE="Click Here to Solve the Puzzle"></CENTER>
</FORM>
<BR><BR>

END_OF_TEXT
