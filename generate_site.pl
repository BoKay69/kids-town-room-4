#!/usr/bin/perl
# Builds docs/ -- a static GitHub Pages site describing the KidsTown
# CGI project. GitHub Pages only serves static files, so this script
# renders a static landing page instead of running kt.cgi live.
use strict;
use warnings;
use File::Copy;
use File::Path qw(make_path);

my $root       = "kidstown_cgi-main";
my $readme     = "$root/README.md";
my $out_dir    = "docs";
my $out_gfx    = "$out_dir/graphics";

make_path($out_gfx);

# --- pull the project description out of the vendored README ---
open(my $rf, '<', $readme) or die "Can't read $readme: $!";
local $/;
my $readme_text = <$rf>;
close $rf;
$readme_text =~ s/\r\n/\n/g;

my ($summary) = $readme_text =~ /\A(.*?)\n-----/s;
$summary =~ s/^#.*\n//;         # drop the leading "# KidsTown" heading
$summary =~ s/^\s+|\s+$//g;

my @paragraphs = split /\n\n+/, $summary;
my $summary_html = join "\n", map { my $p = $_; $p =~ s/\n/ /g; "<p>$p</p>" } @paragraphs;

# --- copy the home-page artwork used on the landing page ---
copy("$root/graphics/home/hometown.gif", "$out_gfx/hometown.gif")
    or die "copy hometown.gif failed: $!";
copy("$root/graphics/home/tatcvrlogo.jpg", "$out_gfx/tatcvrlogo.jpg")
    or die "copy tatcvrlogo.jpg failed: $!";

# --- render the static landing page ---
open(my $out, '>', "$out_dir/index.html") or die "Can't write index.html: $!";
print $out <<HTML;
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>KidsTown</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
  body { font-family: Georgia, serif; background: #EEE2B4; color: #222; max-width: 700px; margin: 2rem auto; padding: 0 1rem; }
  h1 { text-align: center; }
  img.hero { display: block; margin: 1.5rem auto; }
  footer { margin-top: 3rem; font-size: 0.85rem; text-align: center; color: #555; }
  a { color: #204a87; }
</style>
</head>
<body>
<h1>KidsTown</h1>
<img class="hero" src="graphics/hometown.gif" alt="KidsTown" width="155" height="159">

$summary_html

<p>This page is a static archive of the original 1998 KidsTown CGI project.
The interactive site ran on Perl CGI scripts, which GitHub Pages cannot
execute; browse the original source, including <code>cgi-bin/kt.cgi</code>
and the supporting <code>scripts/</code> directory, in the
<a href="https://github.com/BoKay69/kids-town-room-4">project repository</a>.</p>

<footer>Generated from README.md by generate_site.pl</footer>
</body>
</html>
HTML
close $out;

print "Wrote $out_dir/index.html\n";
