# Perl Routines to Manipulate CGI input
# Steven E. Brenner / cgi-lib@pobox.com
# $Id: cgi-lib.pl,v 2.4 1998/04/29 04:22:57 jwgee Exp $
#
# Copyright (c) 1996 Steven E. Brenner  
# Unpublished work.
# Permission granted to use and modify this library so long as the
# copyright above is maintained, modifications are documented, and
# credit is given for any use of the library.
#
# Thanks are due to many people for reporting bugs and suggestions
# especially Meng Weng Wong, Maki Watanabe, Bo Frese Rasmussen,
# Andrew Dalke, Mark-Jason Dominus, Dave Dittrich, Jason Mathews

# For more information, see:
#     http://www.bio.cam.ac.uk/cgi-lib/

$cgi_lib'version = sprintf("%d.%02d", q$Revision: 2.4 $ =~ /(\d+)\.(\d+)/);


# Parameters affecting cgi-lib behavior
# User-configurable parameters affecting file upload.
$cgi_lib'maxdata    = 131072;    # maximum bytes to accept via POST - 2^17
$cgi_lib'writefiles =      0;    # directory to which to write files, or
                                 # 0 if files should not be written
$cgi_lib'filepre    = "cgi-lib"; # Prefix of file names, in directory above

# Do not change the following parameters unless you have special reasons
$cgi_lib'bufsize  =  8192;    # default buffer size when reading multipart
$cgi_lib'maxbound =   100;    # maximum boundary length to be encounterd
$cgi_lib'headerout =    0;    # indicates whether the header has been printed


# ReadParse
# Reads in GET or POST data, converts it to unescaped text, and puts
# key/value pairs in %in, using "\0" to separate multiple selections

# Returns >0 if there was input, 0 if there was no input 
# undef indicates some failure.

# Now that cgi scripts can be put in the normal file space, it is useful
# to combine both the form and the script in one place.  If no parameters
# are given (i.e., ReadParse returns FALSE), then a form could be output.

# If a reference to a hash is given, then the data will be stored in that
# hash, but the data from $in and @in will become inaccessable.
# If a variable-glob (e.g., *cgi_input) is the first parameter to ReadParse,
# information is stored there, rather than in $in, @in, and %in.
# Second, third, and fourth parameters fill associative arrays analagous to
# %in with data relevant to file uploads. 

# If no method is given, the script will process both command-line arguments
# of the form: name=value and any text that is in $ENV{'QUERY_STRING'}
# This is intended to aid debugging and may be changed in future releases

sub ReadParse {
  local (*in) = shift if @_;    # CGI input

  %in=%ktvars;

  return ($errflag ? undef :  scalar(@in)); 
}


# PrintHeader
# Returns the magic line which tells WWW that we're an HTML document

sub PrintHeader {
}


# HtmlTop
# Returns the <head> of a document and the beginning of the body
# with the title and a body <h1> header as specified by the parameter

sub HtmlTop
{
  local ($title) = @_;

  return <<END_OF_TEXT;
<html>
<head>
<title>$title</title>
</head>
<body>
<h1>$title</h1>
END_OF_TEXT
}


# HtmlBot
# Returns the </body>, </html> codes for the bottom of every HTML page

sub HtmlBot
{
  return "</body>\n</html>\n";
}


# SplitParam
# Splits a multi-valued parameter into a list of the constituent parameters

sub SplitParam
{
  local ($param) = @_;
  local (@params) = split ("\0", $param);
  return (wantarray ? @params : $params[0]);
}


# MethGet
# Return true if this cgi call was using the GET request, false otherwise

sub MethGet {
  return (defined $ENV{'REQUEST_METHOD'} && $ENV{'REQUEST_METHOD'} eq "GET");
}


# MethPost
# Return true if this cgi call was using the POST request, false otherwise

sub MethPost {
  return (defined $ENV{'REQUEST_METHOD'} && $ENV{'REQUEST_METHOD'} eq "POST");
}


# MyBaseUrl
# Returns the base URL to the script (i.e., no extra path or query string)
sub MyBaseUrl {
  local ($ret, $perlwarn);
  $perlwarn = $^W; $^W = 0;
  $ret = 'http://' . $ENV{'SERVER_NAME'} .  
         ($ENV{'SERVER_PORT'} != 80 ? ":$ENV{'SERVER_PORT'}" : '') .
         $ENV{'SCRIPT_NAME'};
  $^W = $perlwarn;
  return $ret;
}


# MyFullUrl
# Returns the full URL to the script (i.e., with extra path or query string)
sub MyFullUrl {
  local ($ret, $perlwarn);
  $perlwarn = $^W; $^W = 0;
  $ret = 'http://' . $ENV{'SERVER_NAME'} .  
         ($ENV{'SERVER_PORT'} != 80 ? ":$ENV{'SERVER_PORT'}" : '') .
         $ENV{'SCRIPT_NAME'} . $ENV{'PATH_INFO'} .
         (length ($ENV{'QUERY_STRING'}) ? "?$ENV{'QUERY_STRING'}" : '');
  $^W = $perlwarn;
  return $ret;
}


# MyURL
# Returns the base URL to the script (i.e., no extra path or query string)
# This is obsolete and will be removed in later versions
sub MyURL  {
  return &MyBaseUrl;
}


# CgiError
# Prints out an error message which which containes appropriate headers,
# markup, etcetera.
# Parameters:
#  If no parameters, gives a generic error message
#  Otherwise, the first parameter will be the title and the rest will 
#  be given as different paragraphs of the body

sub CgiError {
  local (@msg) = @_;
  local ($i,$name);

  if (!@msg) {
    $name = &MyFullUrl;
    @msg = ("Error: script $name encountered fatal error\n");
  };

  if (!$cgi_lib'headerout) { #')
    print &PrintHeader;	
    print "<html>\n<head>\n<title>$msg[0]</title>\n</head>\n<body>\n";
  }
  print "<h1>$msg[0]</h1>\n";
  foreach $i (1 .. $#msg) {
    print "<p>$msg[$i]</p>\n";
  }

  $cgi_lib'headerout++;
}


# CgiDie
# Identical to CgiError, but also quits with the passed error message.

sub CgiDie {
  local (@msg) = @_;
  &CgiError (@msg);
  die @msg;
}


# PrintVariables
# Nicely formats variables.  Three calling options:
# A non-null associative array - prints the items in that array
# A type-glob - prints the items in the associated assoc array
# nothing - defaults to use %in
# Typical use: &PrintVariables()

sub PrintVariables {
  local (*in) = @_ if @_ == 1;
  local (%in) = @_ if @_ > 1;
  local ($out, $key, $output);

  $output =  "\n<dl compact>\n";
  foreach $key (sort keys(%in)) {
    foreach (split("\0", $in{$key})) {
      ($out = $_) =~ s/\n/<br>\n/g;
      $output .=  "<dt><b>$key</b>\n <dd>:<i>$out</i>:<br>\n";
    }
  }
  $output .=  "</dl>\n";

  return $output;
}

# PrintEnv
# Nicely formats all environment variables and returns HTML string
sub PrintEnv {
  &PrintVariables(*ENV);
}


# The following lines exist only to avoid warning messages
$cgi_lib'writefiles =  $cgi_lib'writefiles;
$cgi_lib'bufsize    =  $cgi_lib'bufsize ;
$cgi_lib'maxbound   =  $cgi_lib'maxbound;
$cgi_lib'version    =  $cgi_lib'version;
$cgi_lib'filepre    =  $cgi_lib'filepre;

1; #return true 

