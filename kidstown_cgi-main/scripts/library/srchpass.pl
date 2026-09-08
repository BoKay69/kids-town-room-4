#passes the word search pages through the site engine

$FILE="$ktini{libraryscripts}/$ktvars{page_passed}";

open FILE or die "Can't open file $FILE: $!\n";
(@statList) = stat $FILE;
read FILE, $FileEval, $statList[7];
$FileEval =~s/#graphic#/$ktini{librarygraphics}/g;# replace graphic dir
$FileEval =~s/#engine#/$ktini{engine}/g;# replace engine dir
$FileEval =~s/#statename#/$ktvars{statename}/g;#replace statename 
$FileEval =~s/#state#/$ktvars{state}/g;#replace state number
close FILE;
print "$FileEval"; #print the file passed into this program
print "<A
HREF=\"$ktini{engine}?KEY=6000\"><CENTER><B>Back To 
U.S. Map</CENTER></B></A>\n" #Link back to main page


