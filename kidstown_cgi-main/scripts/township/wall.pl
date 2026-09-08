!#/usr/bin/perl

print <<END_OF_TEXT  


<HEAD>
<TITLE>KidsTown Township: Wonders - Great Wall of China</TITLE>
</HEAD>
<BODY BGCOLOR=WHITE>

<CENTER>
<TABLE BORDER=0 WIDTH=600>
<tr>
<td align=center>
<IMG SRC="$ktini{townshipgraphics}/mapch.jpg" HEIGHT=100 WIDTH=150><br>
<b>Map of China</b>
</td>
<td align=center>
<font size=+3><b> 
Great Wall of China</b>
</td>
<td align=center>
<IMG SRC="$ktini{townshipgraphics}/flagch.gif" HEIGHT=100 WIDTH=150><br>
<b>Flag of China</b>
</td>
</tr>
</table>
</font></H1></CENTER>

<center>
<table border=0 width=600>
<center>
<tr>
<td align=center valign=top width=150>
<IMG SRC="$ktini{townshipgraphics}/china3.gif" HEIGHT=250 WIDTH=150><br>
<b>Chinese Painting</b>
</td>
<td align=left width=300>
<B><FONT size=+1>The Great Wall of China is the longest
                        structure ever built. It is about 4,000 miles
                        long. Remarkably, it was all built by hand.
                        Most of the wall was built with bricks and
                        stones. Some of the tallest parts of the Great
                        Wall, near the capital city of Beijing, rises to
                        35 feet. These sections are  about 25 feet wide at
                        the base and 20 feet wide at the top. Watch
                        towers stand 100 to 200 feet apart along the
                        wall. Historically, the wall was built during
                        the time of the Ming dynasty which ruled
                        China from 1368-1644. It's main purpose was
                        to protect China from the invaders of the
                        north, who mostly came from Mongolia.
                        Even after hundreds of years, the Great Wall
                        still stands.
</FONT></B>
</td>
<td align=center valign=top width=150>
<IMG SRC="$ktini{townshipgraphics}/china8.gif" height=250 width=150><br>
<b>Tiananmen Square</b>
</td>

</tr>
</center>
</table>

<br>
<center>
<table border=0 width=600>
<tr>
<td align=center><b><font size=+2>Game of Questions</font></b></td>
</tr>
</table>
</center>

<table border=1 width=600>
<form method="post" action="$ktini{engine}">
<input type=hidden name=KEY value=3007>
<input type=hidden name=file value=wall.txt>


<TR>
<TD ALIGN=CENTER WIDTH=300>
<FONT SIZE=+1>
<B>What dynasty ruled China during the time that the Great Wall was
built?</B></FONT>
<CENTER><SELECT name=Q1></CENTER>
<CENTER><OPTION>Select one<OPTION><B><U><FONT SIZE=+1>Ming<OPTION>Hang<OPTION>
Khan</FONT></U></B></SELECT></CENTER>
</TD>

<TD ALIGN=CENTER WIDTH=300>
<B><FONT SIZE=+1>The Great Wall was built to protect
<BR>China from invaders.</FONT></B>
<CENTER><B><FONT SIZE=+1>
TRUE<INPUT type=radio name=Q2 value=on> 
FALSE<INPUT type=radio name=Q2 value=off>
</FONT></B></CENTER>
</TD>

</TR>
<TR>

<TD COLSPAN=2 ALIGN=CENTER>
<FONT SIZE=+1><B>Most of the Great Wall is built with stones and
________
<BR>(Construct the word)</B></FONT>

<BR>

<SELECT NAME=Q31>
<OPTION>
<OPTION value="A">A
<OPTION value="B">B
<OPTION value="C">C
<OPTION value="D">D
<OPTION value="E">E
<OPTION value="F">F
</SELECT> 


<SELECT NAME=Q32>
<OPTION>
<option value="M">M
<option value="N">N
<option value="O">O
<option value="P">P
<option value="Q">Q
<option value="R">R         
</SELECT>

<SELECT NAME=Q33><OPTION>
<OPTION value="F">F
<OPTION value="G">G
<OPTION value="H">H
<OPTION value="I">I
<OPTION value="J">J
<OPTION value="K">K
</SELECT> 

<SELECT NAME=Q34><OPTION>
<OPTION value="A">A
<OPTION value="B">B
<OPTION value="C">C
<OPTION value="D">D
<OPTION value="E">E
<OPTION value="F">F
</SELECT> 

<SELECT NAME=Q35><OPTION>
<OPTION value="F">F
<OPTION value="G">G
<OPTION value="H">H
<OPTION value="I">I
<OPTION value="J">J
<OPTION value="K">K
</SELECT>

<SELECT NAME=Q36><OPTION> 
<OPTION value="O">O
<OPTION value="P">P
<OPTION value="Q">Q
<OPTION value="R">R
<OPTION value="S">S
<OPTION value="T">T
</SELECT>
</FONT></B>
</TD>
<input type=hidden name=STRLEN value=6>
<input type=hidden name=RETURN value=3004>

</TR>

</TABLE>
<BR>
<BR>
<CENTER><INPUT TYPE=SUBMIT VALUE="Click Here to Solve the Puzzle"></CENTER>
</FORM>

<BR><BR>

END_OF_TEXT
