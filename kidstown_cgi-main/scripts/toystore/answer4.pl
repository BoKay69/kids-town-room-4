#!/usr/bin/perl
print <<End_Of_Text

<head><title></title></head>
<body bgcolor="yellow" text="black" link="0000ff"
vlink="#0000ff">
<center>
<H2>KidsTown, ToyStore</H2>
<p><H1><font size=7>DID YOU GUESS ME?</font></H1>
<p><p>
<img width =250 height=225 
src="$ktini{toystoregraphics}/ostrich.gif">
<br><br><h1><font size=7>I am an ostrich.</font></h1></p>
<FONT SIZE=4>
<A HREF="$ktini{engine}?KEY=7050">Click here to try
another riddle.</A>
</FONT>
</center>
<br><br>


End_Of_Text
