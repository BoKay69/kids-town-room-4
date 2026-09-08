#--africa.pl
#!/usr/bin/perl



# Revision 2.3  1998/04/15  10:23:28  kholck
# Corrected the text for grammar and literacy
#
# Revision 2.2  1998/04/09  03:20:55  mnalmuba
# Aligned all the paragraphs to the left.
#
# Revision 2.1  1998/03/29  12:09:18  kholck
# I just added the word "of" to the giraffe section
# to make the text flow a little smoother.
#
# Revision 2.0  1998/03/12  21:21:46  jwgee
# baseline
#
# Revision 1.50  1997/05/01  18:00:00  jody
# Delivered as KT97
#
# Revision 1.10  1997/05/01  03:35:39  csc47391
# Fixed one comma in the hippo area.
#
# Revision 1.10  1997/05/01  00:35:58  azesch
# Fixed one comma in the hippo area.
#
# Revision 1.9  1997/04/27  19:46:50  klgriess
# Changed the grammar to fit Jody's request.
#
# Revision 1.8  1997/04/26  00:01:35  csc47391
# Repaired navigational text and Help links.
#
# Revision 1.7  1997/04/25  05:09:24  ggjuhl
# Title change
#
# Revision 1.6  1997/04/25  04:49:42  ggjuhl
# REWRITE OF THE AFRICA TEXT
#
# Revision 1.5  1997/04/25  03:00:12  ggjuhl
# Background
#
# Revision 1.4  1997/04/25  02:52:31  ggjuhl
# navagation corection Gerald Juhl
#
# Revision 1.3  1997/04/25  01:56:48  ggjuhl
# Gerald Juhl
#
# Revision 1.2  1997/04/25  00:37:30  ggjuhl
# Navagation inserted by Gerald Juhl
#
# Revision 1.1  1997/04/24  23:26:36  ggjuhl
# Initial revision
#
# Revision 1.2  1997/04/17  16:00:35  s2yee
# *** empty log message ***
#
# Revision 1.1  1997/04/17  15:47:18  s2yee
# Initial revision
#
# Revision 1.1  1996/10/22  23:56:31  jody
# Initial revision
#
print<<hereDocument;

<BR>
<center>
<img src="$ktini{zoographics}/africa.jpg" height=400 width=500
  ALT="Animals of Africa" border=0>
</center>

<FONT SIZE=5>
<P ALIGN=LEFT>
In central Africa, many kinds of animals live on large, grass-covered 
plains.  Animals that eat plants are herbivores.  Some African herbivores 
are <A HREF="#elephant">elephants,</A> <A HREF="#giraffe">giraffes</A> and <A 
HREF="#hippo"> hippos.</A> Animals that eat only meat are carnivores.
<A
HREF="#lion">Lions</A> are carnivores that live in Africa.
</P><BR CLEAR="ALL">


<A NAME="elephant"><H2 ALIGN=CENTER>ELEPHANTS</H2></A>
<P ALIGN=LEFT>
<IMG ALIGN=LEFT HSPACE=10 SRC="$ktini{zoographics}/d6elep.gif" HEIGHT=154 WIDTH=154>
The most amazing feature on an elephant is its long nose, called a trunk.
The elephant uses its trunk to eat and drink.  An elephant eats grass, 
leaves, twigs and fruits by wrapping its trunk around the food and 
bringing it up to its mouth. It drinks by sucking water up into its trunk,
putting the trunk into its mouth, and then spraying the water down its
throat.

</P><BR CLEAR="ALL">

<A NAME="giraffe"><H2 ALIGN=CENTER>GIRAFFES</H2></A>
<P ALIGN=LEFT>
<IMG ALIGN=LEFT HSPACE=10 SRC="$ktini{zoographics}/d6giraff.gif" WIDTH=154 HEIGHT=154> 
Giraffes are the tallest land animals living in the world today.  Because 
giraffes need to eat a lot of food in order to live, they spend about 
half of their lives eating.  Giraffes eat leaves and twigs by curling
their strong tongues around the food to pull it free.
 </P> <BR CLEAR="ALL">

<A NAME="hippo"><H2 ALIGN=CENTER>HIPPOPOTAMUS</H2></A> <P ALIGN=LEFT> <IMG
ALIGN=LEFT
HSPACE=10 SRC="$ktini{zoographics}/d6hippo.gif" WIDTH=154 HEIGHT=154> The
word "hippo" is short for "hippopotamus," which means "horse of
the river."  Although hippos are very big, they do not eat as much food as
you might think.  They spend a few hours each day eating different kinds
of grasses on land.  To protect themselves from predators, hippos spend
most of their time in water. 
  </P> <BR CLEAR="ALL">

<A NAME="lion"><H2 ALIGN=CENTER>LIONS</H2></A> <P ALIGN=LEFT> <IMG
ALIGN=LEFT
HSPACE=10 SRC="$ktini{zoographics}/d6lion.gif" WIDTH=154 HEIGHT=154> Lions
spend most of their time resting and sleeping.  Lions sleep during the day
when it is very hot.  When they hunt, lions must sneak up on prey in order
to catch it.  Female lions do the hunting for their prides (family groups).
  </P> <BR CLEAR="ALL"><BR>

<CENTER><A HREF="$ktini{engine}?KEY=9210">Try taking the Zoo Keeper's Challenge!<A></CENTER><BR>
<BR>
<BR>


<!--End Content-->
</BODY>
hereDocument
