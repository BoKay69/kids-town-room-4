#!/usr/bin/perl

#-------------------------------zoonavbar.pl---------------------------#
print <<hereDocument;
<CENTER>
<TABLE>
<TR ALIGN=CENTER VALIGN=TOP>
        <TD WIDTH=100><a href="$ktini{engine}?KEY=9100"><img src="$ktini{zoographics}/ocean3a.gif" WIDTH=37 HEIGHT=37 ALIGN=center BORDER=0></a></TD>
        <TD WIDTH=100><A href="$ktini{engine}?KEY=9200"><img src="$ktini{zoographics}/africa3a.gif" WIDTH=37 HEIGHT=37 ALIGN=center BORDER=0></A></TD>
        <TD WIDTH=100><A href="$ktini{engine}?KEY=9300"><img src="$ktini{zoographics}/aussie3a.gif" WIDTH=37 HEIGHT=37 ALIGN=center BORDER=0></A></TD>
        <TD WIDTH=100><A href="$ktini{engine}?KEY=9400"><img src="$ktini{zoographics}/polar3a.gif" WIDTH=37 HEIGHT=37 AIIGN=center BORDER=0></A></TD>
</TR>
<TR ALIGN=CENTER VALIGN=TOP>
        <TD WIDTH=100><A href="$ktini{engine}?KEY=9100">Ocean</A></TD>
        <TD WIDTH=100><A href="$ktini{engine}?KEY=9200">Africa</A></TD>
        <TD WIDTH=100><A href="$ktini{engine}?KEY=9300">Australia</A></TD>
        <TD WIDTH=100><A href="$ktini{engine}?KEY=9400">Polar Regions</A></TD>
</TR>
</TABLE>
</CENTER> 
<BR>
hereDocument
