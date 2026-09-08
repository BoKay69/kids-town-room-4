#!/usr/bin/perl
print<<_END_OF_TEXT_
<HEAD></HEAD>
<BODY>
<BLOCKQUOTE>
<FONT SIZE=+2><B>
You may go to any of the points of interest in
KidsTown by clicking on the places shown in
the picture above, or by clicking on
the <A HREF="#buttons">buttons or words</A>
below.
<A NAME="this"> </A>
<BR><BR>
If for some reason you cannot see the pictures, click on the words
that appear like <A HREF="#this">this</A> word.
<BR><BR>
Links to KidsTown points of interest appear at
the top or bottom of most pages.
<BR><BR>
<A HREF="$ktini{engine}?KEY=1000">
<IMG SRC="$ktini{homegraphics}/navbtn_town.gif" ALT="KidsTown" WIDTH=54 HEIGHT=60 BORDER=0 HSPACE=10 ALIGN="LEFT"></A>
<A HREF="$ktini{engine}?KEY=1010">
<IMG SRC="$ktini{homegraphics}/navbtn_help.gif" ALT="Help" WIDTH=54 HEIGHT=60 BORDER=0 HSPACE=10 ALIGN="RIGHT"></A>
A link back to the KidsTown map will be
on the left.
A link to a Help page will be on the right.
<A NAME="buttons">
<BR CLEAR="ALL">
<BR><BR>
Now, choose where you would like to visit, and enjoy your stay at
KidsTown!
</FONT>
</BLOCKQUOTE>
</BODY>
_END_OF_TEXT_