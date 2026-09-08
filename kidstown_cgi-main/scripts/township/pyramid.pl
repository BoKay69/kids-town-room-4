#!/usr/bin/perl

print <<END_OF_TEXT  


<HEAD>
<TITLE>KidsTown Township: Wonders - Pyramids</TITLE>
</HEAD>
<BODY BGCOLOR=LIGHTYELLOW>

<CENTER>
<TABLE BORDER=0 WIDTH=600>
<tr>
<td align=center>
<IMG SRC="$ktini{townshipgraphics}/mapeg.jpg" HEIGHT=100 WIDTH=150><br>
<b>Map of Egypt</b>
</td>
<td align=center>
<font size=+3> 
Great Pyramids of Giza
</td>
<td align=center>
<IMG SRC="$ktini{townshipgraphics}/flageg.gif" HEIGHT=100 WIDTH=150><br>
<b>Flag of Egypt</b>
</td>
</tr>
</table>
</font></H1></CENTER>

<center>
<table border=0 width=600>
<center>
<tr>
<td align=center valign=top>
<IMG SRC="$ktini{townshipgraphics}/egypt6.gif" HEIGHT=250 WIDTH=100><br>
<b>Statue of a Pharoah</b>
</td>
<td>
<B><FONT =+1>We have just arrived in Egypt. In this
wonderful country on the west side of the river Nile, we find the oldest
and one of the biggest monuments of the world: The Great Pyramid
of Giza. This Pyramid was designed by the Egyptian Pharaoh (King) Khufu
around the year 2560 BCE to be his tomb when he died. The Great pyramid
is believed to have been built over a 20-year period. When it was finished,
it was 145.75 meters or 481 feet high. The structure consists of approximately
two million blocks of stone each weighing more then two tons. The inside
of the Great Pyramid has galleries, corridors and escape shafts that all
lead to the center of the pyramid where the sarcophagus(the Pharaoh's tomb)
is located. The Pharaoh was placed there when he died with a lot of gold,
precious stones and other valuable things, that he could take with him
on his mystic journey to the afterlife.
</FONT></B>
</td>
<td align=center>
<IMG SRC="$ktini{townshipgraphics}/desert.jpg" height=250 width=100><br>
<b>River Nile</b>
</td>

</tr>
</table>
</center>

<FORM METHOD="POST" ACTION=\"$ktini{engine}\">
<INPUT TYPE=HIDDEN NAME=KEY VALUE=3007>
<INPUT TYPE=HIDDEN NAME=file VALUE=pyram.txt>

<CENTER>
<TABLE BORDER=0 WIDTH=600>
<TR>
<TD ALIGN=CENTER><B><FONT SIZE=+2>Game of Questions</FONT></B></TD>
</TR>
</TABLE>
</CENTER>

<CENTER>
<TABLE BORDER=1 WIDTH=600>
<TR>

<TD ALIGN=CENTER WIDTH=300>
<FONT SIZE=+1>
<CENTER><B>The Great Pyramid of Giza was built
<BR>
around the year</B></FONT>
<BR>
<SELECT name=Q1>
<OPTION>Select One
<OPTION><B>500 CE</B>
<OPTION><B>2560 BCE</B>
<OPTION><B>5080 BCE</B>
</SELECT>
</CENTER>
</TD>

<TD ALIGN=CENTER WIDTH=300>

<CENTER>
<B><FONT SIZE=+1>Were there any corridors, galleries, or escape shafts
in the pyramid?</FONT></B>
<BR>
<B><FONT SIZE=+1>
Yes<INPUT type=radio name=Q2 value=on> 
No<INPUT type=radio name=Q2 value=off>
</FONT></B>
</CENTER>

</TD>
</TR>

<TR>
<TD COLSPAN=2 ALIGN=CENTER>
<B><FONT SIZE=+1>An ancient building that Egyptians
used as a tomb for their Pharaohs:
<BR>
(Construct the word)</FONT></B>

<CENTER><SELECT NAME=Q31><OPTION></CENTER>
<option value="M">M
<option value="N">N
<option value="O">O
<option value="P">P
<option value="Q">Q
<option value="R">R         
</SELECT>


<SELECT NAME=Q32><OPTION>
<option value="U">U
<option value="V">V
<OPTION value="W">W
<OPTION value="X">X
<OPTION value="Y">Y
<OPTION value="Z">Z
</select>

<SELECT NAME=Q33><OPTION> 
<OPTION value="O">O
<OPTION value="P">P
<OPTION value="Q">Q
<OPTION value="R">R
<OPTION value="S">S
<OPTION value="T">T
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
<OPTION value="K">K
<OPTION value="L">L
<OPTION value="M">M
<OPTION value="N">N
<OPTION value="O">O
<OPTION value="P">P
</SELECT>



<SELECT NAME=Q36><OPTION>
<OPTION value="F">F
<OPTION value="G">G
<OPTION value="H">H
<OPTION value="I">I
<OPTION value="J">J
<OPTION value="K">K
</SELECT>


<SELECT NAME=Q37><OPTION>
<OPTION value="A">A
<OPTION value="B">B
<OPTION value="C">C
<OPTION value="D">D
<OPTION value="E">E
<OPTION value="F">F
</FONT></B></select>
</TD>

</TR>

</TABLE>
<input type=hidden name=STRLEN value=7>
<input type=hidden name=RETURN value=3003>

<BR>
<CENTER><INPUT TYPE=SUBMIT VALUE="Click Here to Solve the Puzzle"></CENTER>

</FORM>
<BR><BR>

END_OF_TEXT
