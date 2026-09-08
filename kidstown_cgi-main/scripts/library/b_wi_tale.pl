print<<end;
<HEAD>
<!-- ***NOTE, the brackets starting with a '!' are comments -->
<TITLE>KidsTown Library: Wisconsin Web Tale</TITLE>
</HEAD>
<!--  CHANGE AND FILL IN, THESE MAY BE OVERRIDDEN -->
<BODY BGCOLOR="#A2F9CD" TEXT=BLACK LINK=BLUE ALINK=RED VLINK=PURPLE>

<CENTER>
<TABLE BORDER=0 WIDTH="600" >
<TR>
<TD>
<CENTER><H1>KidsTown Library: Wisconsin Web Tale</H1></CENTER>


<!--BEGIN CONTENT-->
<BR>

<TABLE BORDER=0 WIDTH=100%>
 <TR>
  <TD> <IMG SRC="$ktini{librarygraphics}/b_wi_map.gif" WIDTH=176 HEIGHT=99>
  <TD> <FONT SIZE=+5 COLOR=#0088FF> <EM> Wisconsin </EM> </FONT>
</TABLE>

<BR>
<CENTER>
<IMG SRC="$ktini{librarygraphics}/sun-line.gif" ALT=sun WIDTH=560 HEIGHT=16 WIDTH=100%>
</CENTER>
<BR>

<H3>Welcome to Wisconsin's Web Tale.
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

<INPUT TYPE="hidden" NAME="KEY" VALUE="6400">	

<P>Please type in your first name: 
<INPUT  TYPE="text"  NAME="name" SIZE=15 MAXLENGTH="30">
</P>

<P>What is one of your least favorite foods 
<SELECT NAME="favorite" SIZE="1">
 <OPTION>peas</OPTION>
 <OPTION>beets</OPTION>
 <OPTION>cucumbers</OPTION>
</SELECT></P>

<P>Which Native Wisconsin tribe would you like to include in your Tale?
<SELECT NAME="native" SIZE="1">
 <OPTION>Winnebago</OPTION>
 <OPTION>Dakota</OPTION>
 <OPTION>Menominee</OPTION></SELECT></P>
<HR>

<P><BR>

<CENTER>
<INPUT TYPE="SUBMIT" NAME="submit" VALUE="Present Tale!">
</CENTER>
</FORM>

<BR>
<CENTER>
<IMG SRC="$ktini{librarygraphics}/sun-line.gif" ALT=sun WIDTH=560 HEIGHT=16 WIDTH=100%>
</CENTER>
<BR><P>



<!--END CONTENT-->
<CENTER>
<H2><A HREF="$ktini{engine}?KEY=6100&state=49">Back to
Wisconsin</A></H2></CENTER>    
<P></P>
</TD>
</TR>

</TABLE>
</CENTER>

</BODY>
end

