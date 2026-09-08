#! /usr/bin/perl

# File: wizard.pl

#
# libraries required for the activity
#
require "$ktini{museumscripts}/cgi-lib.pl";
require "$ktini{museumscripts}/c_parse.pl";

#_________________________________________________________________________
#
#  Subroutine: InitFormVars
#
#  Description: Initialize environment variables and provide a storage
#    area to protect certain variables.  Below are the wizard.pl 
#    configuration data setup instructions.
#
#  Set the following paths relative to the CGI source directory.
#
#  imagePath =           This is the graphics files storage directory.
#  dataPath =            The data file directory.
#         -------------------------------------------
#
#   The following are simply the filenames of the icons.  Do not
#     include a path.
#
#  newQuestionIcon =    The icon for a new question.  This is used on the
#                         answer page when the user answered correctly.
#  tryAgainIcon =       The try again icon for the answer page.  This
#                         is used when the user has answered incorrectly.
#
#_________________________________________________________________________

sub InitFormVars
{

    $imagePath = $ktini{museumgraphics};
    $dataPath = $ktini{museumdata};

    $newQuestionIcon = "newquest.gif";
    $tryAgainIcon = "tryagain.gif";

    #            ------------------------------------

    # The following variables are used to store data.
    # These are set by the program.
    $dataFileName;
    $selection;
    @answer;
    $prevGames;
    $prevSelect;
    $answerImage;
    $gameIndex;

    # GetEnvironment sets these variables using the data in the file 
    #   who's name was passed as a command line argument.
    $environment;
    $coverPageIcon;
    $coverPageFileName;
    $catagoryFileName;
    $catagoryIcon;
    $retCatagoryText;

    #This is for test purposes.
    $lastRevisionDisplay = "Last revision: 4/28/98";
}


#_________________________________________________________________________
#
# Function: MAIN
#_________________________________________________________________________

MAIN:
{
    $cmdLineArg = $ktvars{data};      # The command line argument

    &InitFormVars();               # Initialize environment variables.

    if ($cmdLineArg eq "ANSWER" || $cmdLineArg eq "QUESTION" ||
      $cmdLineArg eq "RET_FROM_HELP")
    {
        # The game is already in progress so get the state variables.
	&GetInputData();

        if ($prevSelect eq "SKIP_QUESTION")
        {
            $prevSelect = "0000";
            $cmdLineArg = "QUESTION";
        }
    }

    else
    {
        # It's a new game and the command line argument is the data file.
         $dataFileName = $cmdLineArg;
    }

    # Get the environment data from the data file (colors, etc.)
    &GetEnvironment();

    if ($cmdLineArg eq "ANSWER")
    {
        # Create and send the answer page.
	&SendAnswerHTML();
    }

    elsif ($cmdLineArg eq "QUESTION")
    {
        # Create and send the question page.
	&DisplayQuestion ("GAME_IN_PROGRESS");
    }

    elsif ($cmdLineArg eq "RET_FROM_HELP")
    {
        &DisplayQuestion ("RET_FROM_HELP");
    }

    else
    {
        # It's the first game.
	&DisplayQuestion ("FIRST_GAME");
    }
}


#________________________________________________________________________
#
#  Subroutine: GetEnvironment
#
#  Description: This subroutine gets the environment data such as 
#    background and text color, and cover page name from the data file.
#________________________________________________________________________

sub GetEnvironment
{
   $fileName = join ("/", $dataPath, $dataFileName);

   open (DATAFILE, $fileName) 
     || CgiDie ("Unable to open $dataFileName");

    while (($fileLine = <DATAFILE>) && ($fileLine ne "ENVIRONMENT\n")) { }

    $fileLine = <DATAFILE>;
    @temp = split ("\"", $fileLine);
    $backgroundColor = $temp[ 1 ];

    $fileLine = <DATAFILE>;
    @temp = split ("\"", $fileLine);
    $backgroundImage = $temp[ 1 ];

    $fileLine = <DATAFILE>;
    @temp = split ("\"", $fileLine);
    $textColor = $temp[ 1 ];

    if (length ($backgroundColor) > 0)
    {
	$environment = join ("", "<BODY LINK=YELLOW VLINK=YELLOW BGCOLOR=\"", $backgroundColor,
	  "\" TEXT=\"", $textColor, "\">");
    }

    else
    {
	$environment = join ("", "<BODY LINK=YELLOW VLINK=YELLOW BACKGROUND=\"", $imagePath, "/",
          $backgroundImage, "\" TEXT=\"", $textColor, "\">");
    }


    $fileLine = <DATAFILE>;
    @temp = split ("\"", $fileLine);
    $coverPageIcon = $temp[ 1 ];

    $fileLine = <DATAFILE>;
    @temp = split ("\"", $fileLine);
    $coverPageFileName = $temp[ 1 ];

    $fileLine = <DATAFILE>;
    @temp = split ("\"", $fileLine);
    $catagoryFileName = $temp[ 1 ];

    $fileLine = <DATAFILE>;
    @temp = split ("\"", $fileLine);
    $catagoryIcon = $temp[ 1 ];

    $fileLine = <DATAFILE>;
    @temp = split ("\"", $fileLine);
    $retCatagoryText = $temp[ 1 ];

    close (DATAFILE);
}


#_________________________________________________________________________
#
#  Subroutine: GetInputData
#
#  Description: This subroutine gets the form data and store the values in 
#    the protected package GAME variables.
#_________________________________________________________________________

sub GetInputData
{
    # This funtion is in "cgi-lib.pl" and it retrieves all the input data.
    &ReadParse(*input);

    $dataFileName = $input{"FILENAME"};
    $prevGames = $input{"PREVGAMES"};
    $prevSelect = $input{"PREVSELECT"};

    # These are for each image on the question page.  Whichever variable 
    #   contains a non-null value is the user's selection.
    $sel1 = $input{"select1.x"};
    $sel2 = $input{"select2.x"};
    $sel3 = $input{"select3.x"};
    $sel4 = $input{"select4.x"};
    $skipQuest = $input{"skipQuestion.x"};

    if ($skipQuest > 0 || $skipQuest eq "0")
    {
        $prevSelect = "SKIP_QUESTION";
    }

    elsif ($sel1 > 0 || $sel1 eq "0") 
    { 
        $selection = 1; 
    }
    
    elsif ($sel2 > 0 || $sel2 eq "0") 
    { 
        $selection = 2; 
    }

    elsif ($sel3 > 0 || $sel3 eq "0") 
    { 
        $selection = 3; 
    }

    else 
    { 
        $selection = 4; 
    }
}


#____________________________________________________________________
#
#  Subroutine: SendAnswerHTML
#
#  Description: Send the HTML to create the answer page which consists
#    of the image selected along with a text response.
#____________________________________________________________________

sub SendAnswerHTML
{
    @prevSelect = split ("", $prevSelect);
    $prevSelect[ $selection - 1 ] = "1";

    $answerStatus = &GetAnswerFormData();

    if ($answerStatus eq "CORRECT_ANSWER")
    {
	@prevSelect = "0000";
    }

    #::::::::::::: Send the HTML :::::::::::::::::::

    print <<"FIRST_BREAK";

<HEAD><TITLE>KidsTown Museum - Planetarium: Answer</TITLE></HEAD>
$environment
<BODY>

<CENTER><BR>

FIRST_BREAK

    print <<"SECOND_BREAK";

<IMG SRC="$imagePath/$answerImage"><BR>
<BR><BR>
<FONT SIZE=5>@answer
</FONT><BR><BR>

<FORM METHOD="POST" ACTION="kt.cgi">
    <INPUT TYPE="HIDDEN" NAME="KEY" VALUE="8500">
    <INPUT TYPE="HIDDEN" NAME="data" VALUE="QUESTION">
    <INPUT TYPE="IMAGE" BORDER=0 NAME="return" SRC="$imagePath/

SECOND_BREAK

    # Here are the images to click on to get the next question or the same
    #   question if the answer was incorrect.
    if ($answerStatus eq "CORRECT_ANSWER")
    {
        print $newQuestionIcon, "\">\n";
    }
    
    else
    {
        print $tryAgainIcon, "\">\n";
    }

    print "<INPUT TYPE=\"HIDDEN\" NAME=\"PREVSELECT\" VALUE=\"", @prevSelect,
      "\">", "\n";

    print <<"END_ANSWER_HTML";

    <INPUT TYPE="HIDDEN" NAME="PREVGAMES" VALUE="$prevGames">
    <INPUT TYPE="HIDDEN" NAME="FILENAME" VALUE="$dataFileName">
</FORM>
</CENTER>


END_ANSWER_HTML

    if ($answerStatus ne "CORRECT_ANSWER")
    {
    print <<"END_SKIPANSWER_HTML";

    <BR><BR>
    <DIV ALIGN=CENTER>
    <FORM METHOD="POST" ACTION="kt.cgi">
    <INPUT TYPE="HIDDEN" NAME="KEY" VALUE="8500">
    <INPUT TYPE="HIDDEN" NAME="data" VALUE="QUESTION">
    <INPUT TYPE="HIDDEN" VALUE="SKIP_QUESTION" NAME="PREVSELECT">
    <INPUT TYPE="SUBMIT" NAME="return" VALUE="SKIP THIS QUESTION">
    <INPUT TYPE="HIDDEN" NAME="PREVGAMES" VALUE="$prevGames">
    <INPUT TYPE="HIDDEN" NAME="FILENAME" VALUE="$dataFileName">
    </FORM>
    </DIV>

END_SKIPANSWER_HTML

    }
    

}


#____________________________________________________________________
#
#  Subroutine: GetAnswerFormData
#
#  Description: Get the image and stored answer that correspond to the
#    user's selection.  Determine if it is correct or incorrect and
#    return that as "CORRECT_ANS" or "INCORRECT_ANS".
#____________________________________________________________________

sub GetAnswerFormData
{
    @prGames = split ("", $prevGames);
    $len = length ($prevGames);

    # Current game is last entry in prGames
    $curGame = $prGames[ $len - 1 ];
    $currentGame = &Decode ($curGame);

    $fileName = join ("/", $dataPath, $dataFileName);

    open (DATAFILE, $fileName)
      || CgiDie ("Unable to open AnswerForm $dataFileName");

    # Move the file pointer to the game in progress.
    for ($i = 0; $i < $currentGame && ($getLine = <DATAFILE>); )
    {
	if ($getLine =~ /^QUESTION/)
	{
	    $i++;
	}
    }

    # Get past the question.
    while ($getLine !~ /CORRECT_ANS/)
    {
	$getLine = <DATAFILE>;
    }

    for ($i = 1; $i < $selection; $i++)
    {
	while ($getLine !~ /IMG/)
	{
	    $getLine = <DATAFILE>;
	}

	$getLine = <DATAFILE>;
    }

    if ($getLine !~ /INCORRECT_ANS/)
    {
	$getLine =~ s/CORRECT_ANS\t//;
	$ansStatus = "CORRECT_ANSWER";
    }

    else
    {
	$getLine =~ s/INCORRECT_ANS.\t//;
	$ansStatus = "INCORRECT_ANSWER";
    }

    while ($getLine !~ /IMG/)
    {
	push (@answer, $getLine);
	$getLine = <DATAFILE>;
    }

    $getLine =~ s/IMG.\t//;
    chop ($getLine);

    $answerImage = $getLine;
    close (DATAFILE);

    return $ansStatus;
}


#_____________________________________________________________________
#
#  Subroutine: DisplayQuestion
#
#  Description: Gather all the data needed to display the question page
#    and call 'SendQuestionHTML' to send the HTML.
#____________________________________________________________________

sub DisplayQuestion
{
    local ($gameStatus) = @_;

    if ($gameStatus eq "FIRST_GAME")
    {
	$prevSelect = "0000";
	$gameIndex = &GetNextGame ("FIRST_GAME");
	$prevGames = &Encode ($gameIndex);
	&SendQuestionHTML();
    }

    else
    {

        if ($prevSelect ne "0000" || $gameStatus eq "RET_FROM_HELP")
        {
            if ($prevGames eq "START_OVER")
            {
                &SendStartOverHTML();
            }

            else
            {
                @prGames = split ("", $prevGames);
                $len = length ($prevGames);

                # Current game is last entry in prGames
                $curGame = $prGames[ $len - 1 ];
                $gameIndex = &Decode ($curGame);
                &SendQuestionHTML();
            }
        }


        else
        {
            $gameIndex = &GetNextGame ($prevGames);

	    if ($gameIndex eq "NO_GAMES_LEFT")
	    {
	        &SendStartOverHTML();
	    }

	    else
	    {
	        $encIndex = &Encode ($gameIndex);
	        $prevGames = join ("", $prevGames, $encIndex);
	        &SendQuestionHTML();
	    }
        }
    }
}


#_________________________________________________________________________
#
#  Subroutine: SendQuestionHTML
#
#  Description: Send the HTML to display the question page.
#_________________________________________________________________________

sub SendQuestionHTML
{
    $fileName = join ("/", $dataPath, $dataFileName);
    $record = &GetRecord ($fileName, $gameIndex);
    @prvSel = split ("", $prevSelect);

print <<"QUESTION_BREAK1";

<HEAD><TITLE>KidsTown Museum - Planetarium: Question</TITLE></HEAD>
$environment
<BODY>

<CENTER>
<BR><BR>
<FORM METHOD="POST" ACTION="kt.cgi">
    <INPUT TYPE="HIDDEN" NAME="KEY" VALUE="8500">
    <INPUT TYPE="HIDDEN" NAME="data" VALUE="ANSWER">
    <FONT SIZE=5>$record{"QUESTION"}</FONT><BR><BR>

    <TABLE ALIGN=CENTER CELLPADDING=2>

QUESTION_BREAK1

    if ($prvSel[ 0 ] == 1)
    {
	print "<TD><IMG SRC=\"", $imagePath, "/", $record{"IMG1"};
	print "\" BORDER=2>\n";
    }

    else
    {
	print "<TD><INPUT TYPE=\"image\" BORDER=0 NAME=\"select1\"";
	print " SRC=\"", $imagePath, "/", $record{"IMG1"}, "\"></TD>\n";
    }

    if ($prvSel[ 1 ] == 1)
    {
	print "<TD><IMG SRC=\"", $imagePath, "/", $record{"IMG2"};
	print "\" BORDER=2>\n";
    }

    else
    {
	print "<TD><INPUT TYPE=\"image\" BORDER=0 NAME=\"select2\"";
	print " SRC=\"", $imagePath, "/", $record{"IMG2"}, "\"></TD>\n";
    }
    if ($prvSel[ 2 ] == 1)
    {
	print "<TD><IMG SRC=\"", $imagePath, "/", $record{"IMG3"};
	print "\" BORDER=2>\n";
    }

    else
    {
	print "<TD><INPUT TYPE=\"image\" BORDER=0 NAME=\"select3\"";
	print " SRC=\"", $imagePath, "/", $record{"IMG3"}, "\"></TD>\n";
    }

    if ($prvSel[ 3 ] == 1)
    {
	print "<TD><IMG SRC=\"", $imagePath, "/", $record{"IMG4"};
	print "\" BORDER=2>\n";
    }

    else
    {
	print "<TD><INPUT TYPE=\"image\" BORDER=0 NAME=\"select4\"";
	print " SRC=\"", $imagePath, "/", $record{"IMG4"}, "\"></TD>\n";
    }

print <<"END_QUESTION_HTML";

    </TABLE>
    <BR><BIG><B>Click on one of the images.</B></BIG><BR><BR>

    <INPUT TYPE="HIDDEN" NAME="PREVSELECT" VALUE="$prevSelect">
    <INPUT TYPE="HIDDEN" NAME="PREVGAMES" VALUE="$prevGames">
    <INPUT TYPE="HIDDEN" NAME="FILENAME" VALUE="$dataFileName">

<BR><BR><HR>

</FORM>

<BR><BR><BR>
<DIV ALIGN=CENTER>
<FORM METHOD="POST" ACTION="kt.cgi">
    <INPUT TYPE="HIDDEN" NAME="KEY" VALUE="8500">
    <INPUT TYPE="HIDDEN" NAME="data" VALUE="QUESTION">
    <INPUT TYPE="HIDDEN" VALUE="SKIP_QUESTION" NAME="PREVSELECT">
    <INPUT TYPE="SUBMIT" NAME="return" VALUE="SKIP THIS QUESTION">
    <INPUT TYPE="HIDDEN" NAME="PREVGAMES" VALUE="$prevGames">
    <INPUT TYPE="HIDDEN" NAME="FILENAME" VALUE="$dataFileName">
</FORM>
</DIV>

END_QUESTION_HTML

}


#_________________________________________________________________________
#
#  Subroutine: SendStartOverHTML
#
#  Descripton: Send the HTML to display the page that asks if the user wants
#    to start over.  This subroutine is called when all available questions
#    have already been asked.
#_________________________________________________________________________

sub SendStartOverHTML
{
    print <<END_STARTOVER_HTML;

<HEAD><TITLE>KidsTown Museum - Planetarium: Completed Category</TITLE></HEAD>
<BODY>
$environment

<CENTER>
<BR><BR><BR>
<FONT SIZE=5>
    You've answered all the questions in this catagory.<P>  
    Select "New Question" to start over.
</FONT><BR><BR>

<A HREF="kt.cgi?KEY=8500&data=$dataFileName">
  <IMG SRC="$imagePath/$newQuestionIcon" BORDER=0></A>

<BR><BR><BR><HR>

<FORM METHOD="POST" ACTION="kt.cgi">
    <INPUT TYPE="HIDDEN" NAME="KEY" VALUE="8500">
    <INPUT TYPE="HIDDEN" NAME="data" VALUE="ANSWER">

    <INPUT TYPE="HIDDEN" NAME="PREVSELECT" VALUE="0000">
    <INPUT TYPE="HIDDEN" NAME="PREVGAMES" VALUE="START_OVER">
    <INPUT TYPE="HIDDEN" NAME="FILENAME" VALUE="$dataFileName">

</FORM>

</CENTER>

END_STARTOVER_HTML
}


#____________________________________________________________________
#
#  Subroutine: GetNextGame
#
#  Description: Get the next unplayed game.  This subroutine uses a random
#    number to chose a game.  If that game has already been played, the
#    first unplayed game in the data file is selected.  If all games have
#    already been played, "NO_GAMES_LEFT" is returned, otherwise the index
#    to the game to be used is returned.
#____________________________________________________________________

sub GetNextGame
{
    local ($prvGames) = @_;

    # Get the number of games in the data file
    $fileName = join ("/", $dataPath, $dataFileName);
    $numGames = &CountRecords ($fileName);

    # Get a random number from 1 to numGames.  We're using the 'gmtime'
    #   function to get the current seconds value and using this as our
    #   random number.  (We can't use the rand function because it always
    #   returns the same random number.)
    ($sec) = gmtime;

    $index = ($sec % $numGames) + 1;

    if ($prvGames eq "FIRST_GAME")
    {
        # It's the first game so $index is our game.
	$currentGame = $index;
    }

    else
    {
	$encIndex = &Encode ($index);

	if (grep (/$encIndex/, $prvGames))
	{
	    # The game has already been played.  Find the next one that
	    #   hasn't been played.

	    $ch = 'a';

	    for ($i = 0; $i < $numGames && (grep (/$ch/, $prvGames)); $i++)
	    {
		if ($ch eq "z")
		{
		    $ch = "A";
		}
		else
		{
		    $ch++;
		}
	    }

	    if ($i == $numGames)
	    {
		# All the games have been played.
		$currentGame = "NO_GAMES_LEFT";
	    }

	    else
	    {
		$currentGame = &Decode ($ch);
	    }
	}

	else
	{
	    $currentGame = $index;
	}
    }

    return $currentGame;
}


#____________________________________________________________________
#
#  Subroutine: Decode
#
#  Descripton: A character value from a to z or A to Z is passed.  That
#    value is decoded into an integer value of 1 to 26 or 27 to 52
#    respectively.  The decoded value is then returned.  (The encoded data
#    is used to represent the games that have already been played.)
#____________________________________________________________________

sub Decode
{
    local ($charVal) = @_;

    $numVal = ord ($charVal);

    if ($numVal <= 90)
    {
	$numVal -= 38;
    }

    else
    {
	$numVal -= 96;
    }

    return $numVal;
}


#____________________________________________________________________
#
#  Subroutine: Encode
#
#  Description: A value between 1 and 52 is passed.  That value is encoded
#    into a character where 1 to 26 is a to z and 17 to 52 is A to Z.  The
#    encoded value is then returned.  (The encoded values are used to
#    represent the games that have already been played.)
#____________________________________________________________________

sub Encode
{
    local ($numVal) = @_;

    if ($numVal <= 26)
    {
	$numVal += 96;
    }

    else
    {
	$numVal += 38;
    }

    $charVal = pack (c1, $numVal);

    return $charVal;
}
