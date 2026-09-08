print<<end;
<HTML>
<HEAD>
<!-- ***NOTE, the brackets starting with a '!' are comments -->
<TITLE>KidsTown Library: Oregon Wacky Web Tale</TITLE>
</HEAD>
<!--  CHANGE AND FILL IN, THESE MAY BE OVERRIDDEN -->
<BODY BACKGROUND="$ktini{librarygraphics}/pzl2.gif" LINK=0000FF ALINK=FFEC18 VLINK=400080 TEXT=000000 BGCOLOR="#A2F9CD">

<CENTER>
<TABLE BORDER=0 WIDTH="600" >
<TR>
<TD>
<CENTER><H1>KidsTown Library: Oregon Wacky Web Tale</H1></CENTER>


<!--BEGIN CONTENT-->
<BR>

<TABLE BORDER=0 WIDTH=100%>
 <TR>
  <TD> <IMG SRC="$ktini{librarygraphics}/b_or_map.gif" WIDTH=176 HEIGHT=99>
  <TD> <FONT SIZE=+5 COLOR=#0088CC> <EM> Oregon </EM> </FONT>
</TABLE>

<BR>
<CENTER>
<IMG SRC="$ktini{librarygraphics}/mcolor-line.gif" WIDTH=526 HEIGHT=17 WIDTH=100%>
</CENTER>
<BR>

<H3><BR>Welcome to Oregon's Wacky Web Tale.  Web Tales allow you to select a
part of speech such as a noun or verb.  Once you make your
selections,
you can click the &quot;Present Tale&quot; button at the bottom of the page to
see your selections in action.  Some of the words presented will make more
sense than others, but whichever one you pick,
the sentences in the Tale will be
enjoyable.  Thanks for coming and be sure to try different combinations.</H3>
<P><BR></P>
<HR>
<CENTER><H2>INSTRUCTIONS</H2></CENTER>
<H4><BR><EM>Read the part of the sentence that is present and then click on
the down arrow to fill in the word of your choice.</EM></H4>
<HR>
<FORM ACTION="$ktini{engine}"  METHOD=POST>
<INPUT TYPE="hidden" NAME="KEY" VALUE="6600">

<P>Many 
 <SELECT NAME="recycle" SIZE="1">
 <OPTION>adults</OPTION>
 <OPTION>children</OPTION>
 <OPTION>dogs</OPTION>
 </SELECT> participate in Oregon's recycling program.</P>

<P>Oregon has many 
 <SELECT NAME="forest" SIZE="1">
 <OPTION>new</OPTION>
 <OPTION>aged</OPTION>
 <OPTION>rainbow</OPTION>
 </SELECT>  forests.</P>

<P>Oregon has many 
 <SELECT NAME="trees" SIZE="1">
 <OPTION>cute</OPTION>
 <OPTION>large</OPTION>
 <OPTION>speedy</OPTION>
 </SELECT>  natural geographical features.</P>
<P>
<HR>
<BR>
<P>
<CENTER>
<INPUT TYPE="SUBMIT" NAME="submit" VALUE="Present Tale!">
</CENTER>
</FORM>

<BR>
<CENTER>
<IMG SRC="$ktini{librarygraphics}/mcolor-line.gif" WIDTH=526 HEIGHT=17 WIDTH=100%>
</CENTER>
<BR><P>

<CENTER>
<H2><A HREF="$ktini{engine}?KEY=6100&state=37">Back to
Oregon</A></H2></CENTER>
<!--END CONTENT-->

</TD>
</TR>
</TABLE>
</CENTER>

</BODY>
</HTML>
end

