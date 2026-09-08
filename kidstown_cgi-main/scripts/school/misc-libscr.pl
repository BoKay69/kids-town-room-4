################################################################
#
#   Copyright (c) 1996 Paramount Consulting
#   UNPUBLISHED WORK
#   ALL RIGHTS RESERVED
#
#   Distribution or modification of this work without the
#   prior expressed written consent of Paramount Consulting
#   is strictly prohibited.
#
################################################################
# This file contains utilities which are frequently used for
# HTML documents.
#
# Top:
#   This utility takes the title, background graphic and
#   text color as input and return appropriately formatted
#   HTML text.
#
# Botm:
#   This utility closes the end of the HTML document.
#
# Die:
#   This utility is called when an error is encountered
#   in the script and terminates execution.
################################################################

sub Top
{
   local (@input) = @_ if @_;

   $URL = &MyURL;
   return <<END_OF_TEXT;
<html>
<head>
<title>$input[0]</title>
</head>
<body bgcolor="$input[2]" background="$input[1]" text="$input[3]" link=333333 alink=ffff1c vlink=ffff1c>
<form method=post action=\"$URL\">
END_OF_TEXT
}


sub Botm
{
   return "</form>\n</body>\n</html>\n";
}


sub Die
{
   local ($msg) = @_;

   print "<h1>$msg</h1><br>\n";
   print "</html>\n";
   die;
}

#
# return 1 for the "require" statement
#
1;


