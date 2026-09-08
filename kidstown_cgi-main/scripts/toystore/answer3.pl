#!/usr/bin/perl
print <<End_Of_Text

<head><title></title></head>
<body bgcolor="yellow" text="black" link="0000ff"
vlink="#0000ff">
<center>
<H2>KidsTown, ToyStore</H2>
<p><H1><font size=7>DID YOU GUESS THEM?</font></H1>
<p><p>
<img width =250 height=200 src="$ktini{toystoregraphics}/dino.gif">
<br><br><h1><font size=7>They are dinosaurs.</font></h1></p>
<FONT SIZE=4>
<A HREF="$ktini{engine}?KEY=7040">Click here to try
another riddle.</A>
</FONT>
<br><br>
</center>
</body>


End_Of_Text
