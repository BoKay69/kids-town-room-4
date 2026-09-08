print<<end;
<HTML>
<HEAD>
<TITLE>KidsTown Library: Wacky Web Tales of Connecticut</TITLE>
</HEAD>
<!--  CHANGE AND FILL IN, THESE MAY BE OVERRIDDEN -->
<BODY BGCOLOR="#A2F9CD" TEXT=BLACK LINK=BLUE ALINK=RED VLINK=PURPLE>

<CENTER>
<TABLE BORDER=0 WIDTH="600" >
<TR>
<TD>
<CENTER>
<H2>KidsTown Library: Wacky Web Tales of Connecticut</H2>
</CENTER>

<BR>

<CENTER>
<TABLE BORDER=0 WIDTH=100%>
 <TR>
  <TD> <IMG SRC="$ktini{librarygraphics}/b_ct_map.gif" alt=map width=176 height=99>
  <TD> <FONT SIZE=+5 COLOR=#FF5512> <EM> Connecticut </EM> </FONT>
</TABLE>

<BR>
<CENTER><IMG SRC="$ktini{librarygraphics}/forest-line.gif" alt=forest width=560 height=29 WIDTH=100%>
</CENTER>
<BR>

<H3><BR> 
Welcome to Connecticut's Wacky Web Tale.
Web Tales allow you to enter words or select from among options.
Sometimes you can make choices about your favorite things.  Once 
you have made your selections, click the &quot;Present Tale&quot; button at
the bottom of the page to see the Web Tale.  Some of the words 
presented will make more sense than others.
Regardless of the choices you make, 
the sentences in the Tale are sure to be enjoyable.
Thanks for coming, and be sure to try different combinations.
</H3>
<P><BR></P>

<HR>
<CENTER><H2>INSTRUCTIONS</H2></CENTER>
<H3><EM>Type in the requested information or select
the word of your choice.</EM></H4>
<HR>

<FORM ACTION="$ktini{engine}"  METHOD=POST>
<INPUT TYPE="hidden" NAME="KEY" VALUE="6800">

<P><SELECT NAME="tribes" SIZE="1">
 <OPTION>Many</OPTION>
 <OPTION>Several</OPTION>
 <OPTION>No</OPTION>
</SELECT> Indian Tribes are native to Connecticut.</P>

<P>Many  <SELECT NAME="animals" SIZE="1">
 <OPTION>small</OPTION>
 <OPTION>giant</OPTION>
 <OPTION>brown</OPTION>
</SELECT>  animals live in Connecticut.</P>

<P>Connecticut like many other states has a 
<SELECT NAME="pollution" SIZE="1">
 <OPTION>problem</OPTION>
 <OPTION>celebration</OPTION>
 <OPTION>solution</OPTION>
</SELECT>  with pollution.</P>
<HR>

<P><BR>
<CENTER>
 <INPUT TYPE="SUBMIT" NAME="submit" VALUE="Present Tale!">
</CENTER>
</FORM>

<BR>
<CENTER>
<IMG SRC="$ktini{librarygraphics}/forest-line.gif" alt=forest width=560 height=29 WIDTH=100%>
</CENTER>
</P>

<BR>
</CENTER>

<CENTER>
<H2><A HREF="$ktini{engine}?KEY=6100&state=$ktvars{state}"<B>BACK TO
$ktvars{statename}</B></A></H2></CENTER> 
<!--END CONTENT-->


</TD>
</TR>

</TABLE>
</CENTER>

</BODY>
</HTML>
end
