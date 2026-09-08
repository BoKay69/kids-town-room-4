#!/usr/bin/perl
print <<End_Of_Text

<head><title></title></head>
<body bgcolor="yellow" text="black" link="0000ff"
vlink="#0000ff">
<center>
<H2>KidsTown, ToyStore</H2>
<p><H1><font size=7>DID YOU GUESS IT?</font></H1>
<p><p>
<img width =200 height=225
src="$ktini{toystoregraphics}/balloon.gif">
<br><h1><font size=7>It is a balloon.</font></h1></p>
<FONT SIZE=4>
<A HREF="$ktini{engine}?KEY=7030">Click here to try
another riddle.</A>
</FONT>
</center>
<br><br>

End_Of_Text
