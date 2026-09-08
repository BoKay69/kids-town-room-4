#!/usr/bin/perl

if (!defined $ktvars{HelpState} ) {
	$ktvars{HelpState}=1010;
}

print <<END_OF_HERE_DOC;
<CENTER>
<TABLE BORDER=0 CELLSPACING=0 CELLPADDING=0>
<TR>
<!--BEGIN NAV BUTTONS-->
<TD><A HREF="$ktini{engine}?KEY=1000">
  <IMG
SRC="$ktini{homegraphics}/navbtn_town.gif"
BORDER=0><CENTER>KidsTown<CENTER></A>
</TD>
<TD><A HREF="$ktini{engine}?KEY=5000">
  <IMG
SRC="$ktini{homegraphics}/navbtn_cityhall.gif"
BORDER=0><CENTER>CityHall</CENTER></A>
</TD>
<TD><A HREF="$ktini{engine}?KEY=4000">
  <IMG
SRC="$ktini{homegraphics}/navbtn_school.gif"
BORDER=0><CENTER>School</CENTER></A>
</TD>
<TD><A HREF="$ktini{engine}?KEY=6000">
  <IMG
SRC="$ktini{homegraphics}/navbtn_library.gif"
BORDER=0><CENTER>Library</CENTER></A>
</TD>
<TD><A HREF="$ktini{engine}?KEY=9000">
  <IMG
SRC="$ktini{homegraphics}/navbtn_zoo.gif"
BORDER=0><CENTER>Zoo</CENTER></A>
</TD>
<TD><A HREF="$ktini{engine}?KEY=7000">
  <IMG
SRC="$ktini{homegraphics}/navbtn_toystore.gif"
BORDER=0><CENTER>ToyStore</CENTER></A>
</TD>
<TD><A HREF="$ktini{engine}?KEY=2000">
  <IMG
SRC="$ktini{homegraphics}/navbtn_citypark.gif"
BORDER=0><CENTER>CityPark</CENTER></A>
</TD>
<TD><A HREF="$ktini{engine}?KEY=3000">
  <IMG
SRC="$ktini{homegraphics}/navbtn_township.gif"
BORDER=0><CENTER>TownShip</CENTER></A>
</TD>
<TD><A HREF="$ktini{engine}?KEY=8000">
  <IMG
SRC="$ktini{homegraphics}/navbtn_museum.gif"
BORDER=0><CENTER>Museum</CENTER></A>
</TD>
<TD><A HREF="$ktini{engine}?KEY=$ktvars{HelpState}">
  <IMG
SRC="$ktini{homegraphics}/navbtn_help.gif"
BORDER=0><CENTER>Help</CENTER></A>
</TD>
<!--END NAV BUTTONS-->
</TR>
</TABLE>
</CENTER>
END_OF_HERE_DOC
