#!/usr/bin/perl

# These are the variables that we will use in our script.
$Q1="";
$Q2="";
$Q3="";
$TITLE="";
$IMAGE0="";
$IMAGE1="";
$IMAGE2="";
$IMAGE3="";
$FQ1="";
$FQ2="";
$FQ3="";
$TEXT="";
$COUNTER=0;
$FILE="";

&PRINT;

sub PRINT {

$SPELL="";

	print "<head>";
	print "<title>KidsTown Township: Wonders - Results</title>"; 
	print "</head>";
	print "<body bgcolor=white>";

        print "\n<CENTER><TABLE WIDTH=600 BORDER=0><TR><TD>\n";

	$Q1="$ktvars{Q1}";
	$Q2="$ktvars{Q2}";
	$FILE="$ktini{townshipdata}/$ktvars{file}";
	
	$STRLEN="$ktvars{STRLEN}";


	for ($i=1;$i<=$STRLEN;$i=$i+1) {

		$VAR="Q3"."$i";
		$Q3="$Q3"."$ktvars{$VAR}";
	}


}


&OUT;


sub OUT {

		$LINES="";
		@ANSWERS=();

		open(CONTENTS,"$FILE");

		while(<CONTENTS>) {

			$LINES="$_";

		}
		
		close(CONTENTS);


		@ANSWERS=split(/;/,$LINES);
		$TITLE="$ANSWERS[0]";
		$IMAGE0="$ANSWERS[1]";
		$IMAGE1="$ANSWERS[2]";
		$IMAGE2="$ANSWERS[3]";
		$IMAGE3="$ANSWERS[4]";
		$FQ1="$ANSWERS[5]";
		$FQ2="$ANSWERS[6]";
		$FQ3="$ANSWERS[7]";
		$TEXT="$ANSWERS[8]";


		if ( "$Q1" eq "$FQ1" ) {
			$COUNTER=$COUNTER+1;
		}
		if ( "$Q2" eq "$FQ2" ) {
			$COUNTER=$COUNTER+1;
		}
		if ( "$Q3" eq "$FQ3" ) {
			$COUNTER=$COUNTER+1;
		}	

		&OUTPUT;

}

sub OUTPUT {


	if ( $COUNTER == 3 ) {

		print "<center>";
		print "\n<table border=0 cellspacing=0 cellpadding=0>";
		print "\n<tr>";
		print "\n<td bgcolor=lightgreen align=center><font size=+4><b>Good Job</b></font></td>";
		print "\n</tr>";
		print "\n<tr>";
		print "\n<td bgcolor=lightgreen><font size=+2><b> You answered all $COUNTER questions correctly.";
		print "\nThis view of the $TITLE is your prize</b></font>";
		print "\n</td>";
		print "\n</tr>";
		print "<tr><td><br><br></td></tr>";
		print "\n<tr>";
		print "\n<td align=center><img src=\"$ktini{townshipgraphics}/$IMAGE3\"></td>";
		print "\n</tr>";
		print "<tr><td><br><br></td></tr>";
		print "\n<tr><td bgcolor=lightgreen><font size=+1><b>$TEXT</b></font></td></tr>";
		print "<tr><td><br><br></td></tr>";
		print "\n</table>";
		print "\n<table border=0>";
		print "<td width=25></td>";
		print "<td align=center><a href=\"$ktini{engine}?KEY=3000\"><img src=\"$ktini{townshipgraphics}/wwm.jpg\" width=50 height=50></a></td></tr>";
		print "<td width=25></td>";
		print "<td align=center><b>Main Page</b></td></tr>";
		print "\n</table>";
		print "</center>";

	} 

	else {

		$RESULT=3-$COUNTER;
		
		print "<center>";
		print "\n<table border=0 cellspacing=0 cellpadding=0>";
		print "\n<tr>";
		print "\n<td bgcolor=lightgreen align=center><font size=+4><b>Almost there...</b></font></td>";
		print "\n</tr>";
		print "\n<tr>";
		print "\n<td bgcolor=lightgreen><font face=arial size=+2><b>Nice try, but you missed $RESULT question(s).";
		print "\n With your effort, you have earned this glimpse of the $TITLE.</b></font>";
		print "\n</td>";
		print "\n</tr>";
		print "<tr><td><br><br></td></tr>";
		print "\n<tr>";

		if ( $COUNTER == 0 ) {
			print "\n<td align=center><img src=\"$ktini{townshipgraphics}/$IMAGE0\"></td>";
		}
		elsif ( $COUNTER == 1 ) {
			print "\n<td align=center><img src=\"$ktini{townshipgraphics}/$IMAGE1\"></td>";

		}
		elsif ( $COUNTER == 2 ) {
			print "<td align=center><img src=\"$ktini{townshipgraphics}/$IMAGE2\"></td>";

		}

		print "</tr>\n";
		print "<tr><td><br><br></td></tr>\n";
		print "</table>\n";
		print "<table border=0>\n";
		print "<tr><td align=center><a href=\"$ktini{engine}?KEY=$ktvars{RETURN}\"><img src=\"$ktini{townshipgraphics}/quest.jpg\" width=50 height=50></a></td>\n";
		print "<td width=25></td>";
		print "<td align=center><a href=\"$ktini{engine}?KEY=3000\"><img src=\"$ktini{townshipgraphics}/wwm.jpg\" width=50 height=50></a></td></tr>";
		print "<tr><td align=center><b>Try Again</b></td>";
		print "<td width=25></td>";
		print "<td align=center><b>Main Page</b></td></tr>";
		print "\n</table>";
		print "</center>";

	}

print "\n</TD></TR></TABLE></CENTER>\n";
print "<BR><BR>\n";

}


