#--d6_oc13.pl

#!/usr/bin/perl

# Revision 2.1  1998/03/30  11:50:50  kholck
# Capitalized "Earth" according to the style guide.
#
# Revision 2.0  1998/03/12  21:22:08  jwgee
# baseline
#
# Revision 1.50  1997/05/01  18:00:00  jody
# Delivered as KT97
#
# Revision 1.6  1997/04/27  21:57:33  ggjuhl
# Added Go Back Link
#
# Revision 1.5  1997/04/27  16:06:50  mcurran
# added navigation bar
#
# Revision 1.4  1997/04/25  23:27:22  csc47391
# Reversed changes made in -r1.3
#
# Revision 1.2  1997/04/25  06:46:17  klgriess
# changed picture size and text and removed background
#
# Revision 1.1  1997/04/25  01:42:34  x2liang
# Initial revision
#
# Revision 1.1  1996/10/22  23:56:31  jody
# Initial revision
#

print<<hereDocument;


<CENTER>
<FONT SIZE=5>
<P>
<IMG SRC="$ktini{zoographics}/ocean.jpg" border=0 alt="ocean" ALIGN=LEFT
width=200 height=200 HSPACE=10 VSPACE=10 >
Yes, water covers over two-thirds of the surface of the Earth.
</P>
<BR CLEAR="ALL">
<BR>
<BR>


<A HREF="$ktini{engine}?KEY=9100">
Go back to the Animals of the Ocean.
<BR>
<BR>

<!--END CONTENT-->

</CENTER>
</BODY>
hereDocument
