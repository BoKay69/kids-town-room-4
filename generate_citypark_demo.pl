#!/usr/bin/perl
#---------------------------------------------------------
# Script:      generate_citypark_demo.pl
#
# Description: Converts the first few "rooms" of the original 1998
#              KidsTown CityPark adventure (kidstown_cgi-main/data/citypark/)
#              from Perl-CGI template text into a JSON file that a
#              static, client-side single-page app can play back.
#
#              This is a *progress preview*, not the full port: only
#              PAGE_NUMBERS below are converted. The original CGI story
#              has many more rooms (page6, page7, ...); we are
#              intentionally converting a handful at a time so there is
#              something real to click through on GitHub Pages while the
#              rest of the port is still in progress.
#
#              The original CGI pages are plain text with a few
#              template tokens that only meant something to the old
#              kt.cgi engine:
#
#                #ktini{engine}#           -> path to kt.cgi itself
#                #ktini{cityparkgraphics}# -> path to the room's images
#                #name# / #xname#          -> the player's name
#                #page# / #from#           -> CGI navigation bookkeeping
#                <A HREF="...?KEY=2010&page=N&...">label</A>
#                                           -> a link to another room
#
#              Since GitHub Pages can only serve static files (no CGI),
#              this script rewrites those tokens into plain HTML that a
#              browser can render on its own:
#
#                #ktini{cityparkgraphics}# -> "graphics" (a local folder
#                                             this script also populates)
#                #name# / #xname#          -> "{{NAME}}", a placeholder the
#                                             SPA's JavaScript fills in
#                                             with the player's chosen name
#                #page# / #from#           -> removed (no longer needed;
#                                             the SPA tracks navigation
#                                             itself, in the browser)
#                <A HREF="...page=N...">   -> <button class="kt-choice"
#                                             data-target="N">, wired up
#                                             by docs/citypark/index.html
#
# Output:      docs/citypark/story.json      -- the converted pages
#              docs/citypark/graphics/*.gif  -- only the images actually
#                                               referenced by those pages
#
# Usage:       perl generate_citypark_demo.pl
#              (run from the repository root)
#---------------------------------------------------------
use strict;
use warnings;
use File::Path qw(make_path);
use File::Copy;
use JSON::PP;   # part of core Perl since 5.14; no extra install needed

# --- which rooms of the story we are converting in this pass ---------
# Extend this list as more of the adventure gets ported.
my @PAGE_NUMBERS = (1, 2, 3, 4, 5);

my $src_dir      = "kidstown_cgi-main/data/citypark";
my $src_graphics = "kidstown_cgi-main/graphics/citypark";
my $out_dir      = "docs/citypark";
my $out_graphics = "$out_dir/graphics";

make_path($out_graphics);

my %pages;          # page number -> converted HTML string
my %needed_images;  # filename -> 1, collected as we scan each page

for my $num (@PAGE_NUMBERS) {
    my $path = "$src_dir/page$num";
    open(my $fh, '<', $path) or die "Can't read $path: $!";
    local $/;               # slurp mode: read the whole file at once
    my $text = <$fh>;
    close $fh;

    $text =~ s/\r\n/\n/g;   # normalize line endings, same as generate_site.pl

    # --- turn each CGI navigation link into an SPA choice button -----
    # The /s modifier lets "." match newlines, because some of the
    # original links are wrapped across multiple lines, e.g.:
    #   <A
    #   HREF="...">Yes</A>
    # The /e modifier runs replacement_link(...) as code for every match
    # instead of treating the replacement as a plain string.
    $text =~ s{<A\s+HREF="([^"]*)"\s*>(.*?)</A>}{replacement_link($1, $2)}gise;

    # --- rewrite the remaining template tokens ------------------------
    $text =~ s/#ktini\{cityparkgraphics\}#/graphics/g;  # image folder
    $text =~ s/#x?name#/{{NAME}}/g;                     # player's name
    $text =~ s/#ktini\{engine\}#//g;                    # leftover safety net:
    $text =~ s/#page#|#from#//g;                        # these only ever
                                                         # appeared inside the
                                                         # links we already
                                                         # rewrote above

    $text =~ s/^\s+|\s+$//g;   # trim leading/trailing whitespace

    # --- note every image this page actually uses ---------------------
    while ($text =~ /graphics\/([\w.-]+\.gif)/gi) {
        $needed_images{$1} = 1;
    }

    $pages{$num} = $text;
}

# --- copy only the images that are actually referenced ------------------
for my $image (sort keys %needed_images) {
    copy("$src_graphics/$image", "$out_graphics/$image")
        or die "copy $image failed: $!";
}

# --- write story.json for the SPA to fetch() at runtime ------------------
my $story = {
    start => $PAGE_NUMBERS[0],
    pages => \%pages,
};

open(my $out, '>', "$out_dir/story.json") or die "Can't write story.json: $!";
print $out JSON::PP->new->canonical->pretty->encode($story);
close $out;

print "Converted " . scalar(@PAGE_NUMBERS) . " page(s) -> $out_dir/story.json\n";
print "Copied " . scalar(keys %needed_images) . " image(s) -> $out_graphics/\n";

#---------------------------------------------------------
# Function:     replacement_link
#
# Description:  Given the HREF and inner text of one <A>...</A> tag
#               from the original CGI markup, returns the HTML for the
#               button the SPA should show instead.
#
# Arguments:
#       $href   The raw HREF attribute value, e.g.
#               "#ktini{engine}#?KEY=2010&page=3&name=#xname#&from=2"
#       $label  The raw (possibly multi-line) link text, e.g. "Yes"
#
# Returns:      An HTML string, e.g.
#               <button type="button" class="kt-choice" data-target="3">Yes</button>
#
#               If the link doesn't point at another numbered page (the
#               original "Back" links to the CGI's main menu, KEY=2000,
#               are like this), data-target is set to "menu" and the SPA
#               treats that as "leave the demo, go back to the project
#               landing page" -- there's no menu system in this preview.
#---------------------------------------------------------
sub replacement_link {
    my ($href, $label) = @_;

    $label =~ s/\s+/ /g;   # collapse the newlines/indentation that HTML
    $label =~ s/^\s+|\s+$//g;   # line-wrapping left inside the link text

    my ($target) = $href =~ /page=(\d+)/;
    $target = "menu" unless defined $target;

    return qq{<button type="button" class="kt-choice" data-target="$target">$label</button>};
}
