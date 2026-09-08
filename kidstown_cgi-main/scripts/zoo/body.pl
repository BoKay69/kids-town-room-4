#!/usr/bin/perl 



print "<HEAD>\n";
print "<!-- ***NOTE, the brackets starting with a '!' are comments -->\n";

#If the zoo header is the main page header, then, just output the
#Title of the page as the main page header.
#Otherwise, this is a page within the zoo and will need to be entitled
#with a reference to the zoo.
if($ktvars{ZooHeader} eq "KidsTown Zoo")
{
        print "<TITLE>KidsTown Zoo</TITLE>\n";
}
else
{
        print "<TITLE>KidsTown Zoo: $ktvars{ZooHeader}</TITLE>\n";
}


print <<hereDocument;
</HEAD>
<BODY BGCOLOR=#FFFFC0 TEXT=BLACK VLINK=PURPLE ALINK=RED LINK=BLUE>
hereDocument
