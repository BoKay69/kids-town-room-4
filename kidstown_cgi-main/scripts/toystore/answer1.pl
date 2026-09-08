#!/usr/bin/perl
print <<End_Of_Text

<HEAD><TITLE>Poem</TITLE></HEAD>
<body bgcolor="yellow" text="black" link="0000ff"
vlink="#0000ff">
<H2><center>KidsTown, ToyStore<H2>
<p><H1><font size=7>DID YOU GUESS IT?</font></H1>
<p><p>
<img width =200 height=175
src="$ktini{toystoregraphics}/rain3.gif">
<br><h1><font size=7>It is a rainbow.</font></h1></p>
<FONT SIZE=4>
<p>
<A HREF="$ktini{engine}?KEY=7020">Click here to try
another riddle.</A>
</FONT>
</center>
</body>
<br>

End_Of_Text
