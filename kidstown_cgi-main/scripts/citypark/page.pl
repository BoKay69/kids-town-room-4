#==========================================================#
# Name        :page.pl                                     #        
# Description :page.pl retrieves information from the page #
#              data files. Loads text data into variables  #
#              and then sent along with certain html tags  #          
#              to kt.cgi(site engine) which then performs  #
#              an eval. page.pl is invoked for every new   #             
#              page that is requested.                     # 
# Input       :$ktvars{name};$ktvars{page};$ktvars{from};  #
#              which is received from the hash established #
#              in kt.cgi as ktvars                         #
# Date        :Modifications done Spring 98                #
#==========================================================#

   #gets directory where the data files live
$content ="$ktini{cityparkdata}/page";

   #concatenates data page requested to data directory
$FILE=$content.$ktvars{page};            

   #opens data file that is to be read
open FILE or die "Can't open file $FILE";

   #if no name is entered in main.pl use default name
if($ktvars{name} eq ""){
 $ktvars{name}="My friend";}

   #handles the space between My and friend
$xname = $ktvars{name};
$xname =~ s/ /\+/g; #replace spaces with + signs

   #read file in and do text replacement
(@statList) = stat $FILE; #Get the size of the file
read FILE, $theText, $statList[7]; #File size is in the 7th element
$theText =~ s/#name#/$ktvars{name}/g; #replace name 
$theText =~ s/#xname#/$xname/g; #replace xname
$theText =~ s/#page#/$ktvars{page}/g;#replace page vars in text file
$theText =~ s/#from#/$ktvars{from}/g; #replace from which page you came
$theText =~ s/#ktini{engine}#/$ktini{engine}/g;#replace ktinifile
$theText =~ s/#ktini{cityparkgraphics}#/$ktini{cityparkgraphics}/g;


   #text information wrapped in html tags
print"<HEAD>\n";
print"<TITLE>Kids Town City Park:Interactive Text Story</TITLE>\n";
print"</HEAD>\n";
print"<BODY BGCOLOR=#F5F5DC TEXT=#000000 LINK=BLUE VLINK=#9400D3 
   ALINK=#B03060>\n";

print"<CENTER><H1><P>\n";
print"$ktvars{name}";
print"'s  Big Journey</H1></CENTER>\n";
print"</P>\n";
print"<P>\n";
print"<HR>\n";
print"<BLOCKQUOTE>\n";
print"<FONT SIZE=\"+2\">\n";
print"$theText\n";
print"</FONT>\n";
print"</BLOCKQUOTE>\n";
print"<HR>\n";
print"</P>\n";
print"</BODY>\n";
                                    
#end of page.pl
