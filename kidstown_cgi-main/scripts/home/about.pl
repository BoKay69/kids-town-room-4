#!/usr/bin/perl
print<<_END_OF_TEXT_;

<HEAD>
<TITLE>About KidsTown</TITLE>
</HEAD>

<BODY BGCOLOR="#EEE2B4" TEXT="BLACK" ALINK="RED" LINK="BLUE" VLINK="PURPLE">

<CENTER>
<TABLE WIDTH=500 BORDER=0>
<TR>
<TD>
<IMG SRC="$ktini{homegraphics}/tatcvrlogo.jpg" ALIGN=LEFT WIDTH=77 HEIGHT=103>
<IMG SRC="$ktini{homegraphics}/nuu3.gif" ALIGN=RIGHT WIDTH=118 HEIGHT=83>
<DIV ALIGN="CENTER">
<B><BR><FONT SIZE=+2>The Making of<BR></FONT>
<FONT SIZE=+4>KidsTown</FONT>
</B>
</DIV>
</TD>
</TR>
<TR>
<TD>
<B><DIV ALIGN=Left>
<BR><BR>
KidsTown was conceived, designed and developed by students at the University 
of Colorado at Denver through participation in the Senior Design Project 
course offered by the Department of Computer Science and Engineering.  The 
course represents the capstone experience of the Bachelor of Science in 
Computer Science and Engineering degree program and involves integrating and 
applying academic learning through the design and creation of practical 
products.

<P>
KidsTown is a result of the <A HREF="$ktini{chlitproj}">Children's
Literacy Project</A>, a joint effort 
by the <A HREF="$ktini{tatteredcover}">Tattered Cover Book Store</A> and
the <A HREF="$ktini{cudenver}">University of Colorado at Denver</A> to
provide CU-Denver students with real-world experience in developing a
working relationship with a business while designing and creating
computer-based tools for promoting literacy skills among children.
Through this collaboration, <A HREF="$ktini{engine}?KEY=1200">the 
participants</A> address their individual goals in a manner that 
acknowledges a common responsibility for addressing the needs of other 
community members.

<P>For more information regarding KidsTown and the Children's Literacy 
project, please contact <A HREF="http://www.jodypaul.com">Dr. Jody
Paul</A> at <A HREF="$ktini{jpaulmail}">jody\@acm.org</A>.

</DIV>
<BR><BR>
</TD>
</TR>

<TR>
<TD>
<BR><BR>
<DIV ALIGN="CENTER">
<B><FONT SIZE=+2><A HREF="$ktini{engine}?KEY=1000">Return to
KidsTown</A></FONT></B>
</DIV>
<BR><BR>
</TD>
</TR>
</TABLE>
</CENTER>

_END_OF_TEXT_
