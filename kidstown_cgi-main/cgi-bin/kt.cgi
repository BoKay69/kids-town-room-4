#!/usr/local/bin/perl

#---------------------------------------------------------
# Function:     String2hash
# 
# Description:  Takes a string with key value pairs
#               in it and loads that string into
#               the reference to the hash.
#
# Arguments:    
#       @_[0]   Holds a string of the form
#               key1=value1&key2=value2&key3=value3...
#               Delimiters may be ampersand "&" or
#               space " ", but not both.
#               Assigned to @params[0] and $string
#
#       @_[1]   Holds a reference to a hash which will
#               be populated using the contents of $string
#               Assigned to @params[1] and $hash
#
# Returns:      No explicit return value.
#               Works on the reference in $hash
#
# Usage - Call:
#       $request = "KEY=101&score=30";  #This is something you would
#                                       #get from the query string
#
#       %ktvars();                      #This is your hash
#
#       String2hash($request,\%ktvars);
#
#       - Result:
#       $ktvars{KEY} == 101
#       $ktvars{score} == 30
#---------------------------------------------------------
sub String2hash {
        my @params = @_;        #Get the parameters from the standard
                                #variable @_.  The @_ is a standard
                                #variable used by perl to hold the
                                #parameters that were passed to this
                                #rountine.

        my $string=@params[0];  #gets the first parameter which would
                                #be something like the request string

        my $hash=@params[1];    #gets the hash table to be filled
                                #with arguments from parameter 1
        

        my @parameter_list = split(/[& ]/,$string);     #splits up
                                        #the all of the variables 
                                        #(i.e.)  KEY=101&score=60
                                        #will be two different 
                                        #arguments in the array
                                        #parameter_list: KEY=101
                                        #and score=60                                     

        my $paramname, $paramvalue;     #localize variables

                                #for each element in the 
                                #parameter list ...
        foreach (@parameter_list) {
                        
                        #split the variables on the equal sign
                        #into the name of the variable and 
                        #and the value of the variable
                ($paramname, $paramvalue) = split(/=/);
                        
                        #substitue all + signs with spaces 
                $paramname =~ s/\+/ /g; 

                        #change all hex characters to ascii
                $paramname =~ s/%(..)/pack("c",hex($1))/ge;

                        #substitue all + signs with spaces 
                $paramvalue =~ s/\+/ /g;

                        #change all hex characters to ascii
                $paramvalue =~ s/%(..)/pack("c",hex($1))/ge;

                        #load the name of the variable and its
                        #value into the hash unless this variable
                        #is defined.
                        #Note:  The $$ will reference the actual
                        #hash that was passed in.
                $$hash{$paramname} = $paramvalue unless $$hash{$paramname};
        }
}


#---------------------------------------------------------
# Function:     File2hash
# 
# Description:  Takes the name of a file and opens it
#               and than loads the reference to the 
#               hash with the key value pairs out of
#               the file
#
# Arguments:    
#       @_[0]   A string that holds the name of a file to be
#               loaded into a hash. The file content should
#               be of the following format, one pair per line:
#               key=value
#               key=value
#               ...
#               Assigned to @params[0] and $string
#
#       @_[1]   Reference to a hash to be populated by $string
#               Assigned to @params[1] and $hash
#
# Returns:      No explicit return value.
#               Works on the reference in $hash
#---------------------------------------------------------
sub File2hash {
        my @params = @_;
        $file=@params[0];
        $hash=@params[1];
        
        $CONFIGFILE="$file";
        open CONFIGFILE or die "Can't open Config File $CONFIGFILE: $!\n";
        while (<CONFIGFILE>) {
                ($hashkey,$hashvalue)=split /[=]/;
                chomp $hashvalue;
                chomp $hashkey;
                $$hash{$hashkey}=$hashvalue;
        }

}


#---------------------------------------------------------
# Function:    EvalFile 
#
# Description:  Takes a filename, verifies its 
#               existence, and then evals that file
#
# Arguments:
#       @_[0]   A file name that will be evaled
#               Assigned to @params[0] and $FILE
#
# Returns:      No explicit return value.
#---------------------------------------------------------
sub EvalFile {
        my @params = @_;
        $FILE=@params[0];

        if (defined $FILE) {
                open FILE or die "Can't open file $FILE: $!\n";
                (@statList) = stat $FILE;
                read FILE, $FileEval, $statList[7];
                close FILE;
                eval $FileEval;
        } else {
                print "Content-type: text/html\n\n<HTML>\n<H1>Fatal Error</H1>ERROR: could not run specified activity:<$FILE>\n</HTML>\n";
        }
}


#---------------------------------------------------------
# Function:     MergeGetPost
#
# Description:  Takes parameters passed by either the Get
#               or Post methods and merges them into one string
#
# Arguments:    Works on ENV variables
#                 REQUEST_METHOD, QUERY_STRING, CONTENT_LENGTH
#
# Returns:      String containing cgi parameters ($Request)
#---------------------------------------------------------
sub MergeGetPost {
        if ($ENV{'REQUEST_METHOD'} eq "GET") {#get input for GET requests
                $Request = $ENV{'QUERY_STRING'};
        } elsif ($ENV{'REQUEST_METHOD'} eq "POST") {#get input for POST requests
                read(STDIN, $Request,$ENV{'CONTENT_LENGTH'})
                || die "Content-type: text/html\n\n<HTML>\n<H1>Fatal Error</H1>Could Not get query\n</HTML>\n";
        }
        return $Request
}


#================================================================#
#                                                                #
#                START OF MAIN SECTION                           #
#                                                                #
#================================================================#
%ktvars=();     #Will hold variables from cgi parameters and local database
%ktini=();      #Will hold directory specifications for redirection

$request=MergeGetPost();        #Place Get/Post cgi info into $request
String2hash($request,\%ktvars); #Load variable/value pairs into $ktvars
File2hash("./kt.ini",\%ktini);  #Load directory info into $ktini

print "Content-type: text/html\n\n";
print "<HTML>\n";       #begin the html stream

$DATABASE="$ktini{enginektdb}";
open DATABASE or die "Can't open Database $DATABASE: $!\n";

$KEY="#$ktvars{KEY}#";                  #Pull KEY out of CGI hash
@Key_Field = grep s/$KEY// , <DATABASE>; #Pull KEY lines out of DB
close DATABASE;
if (@Key_Field[0] eq "") {
	$KEY="#1000#";
	open DATABASE or die "Can't open Database $DATABASE: $!\n";
	@Key_Field = grep s/$KEY// , <DATABASE>;
	close DATABASE;
}

# For each KEY line retrieved from DB, check config info
# Load DB arguments into CGI hash, then run activity
while ($line=shift @Key_Field) {
        chomp $line;

        ($script2eval,$Args2load)=split / /,$line,2;    #split activ from args
        String2hash($Args2load,\%ktvars);               #load args into cgi hash

        # determine if config info is used and then use it
        ($DIR,$TMPFILE)=split /\//,$script2eval,2;
        if (defined $ktini{$DIR}) { $FILE="$ktini{$DIR}/$TMPFILE";
        } else { $FILE=$script2eval; }

        #print $FILE,"-->",%ktvars,"<--\n";
        EvalFile($FILE);
        #print $FILE,"==>",%ktvars,"<==\n";
}
print "</HTML>\n";      # end the HTML stream
