#!/usr/bin/perl
# create version without the notes (by commenting out link with "kbroman_presentation.css")

$ifile = "index.html";
$ofile = "presentation.html";
open(IN, $ifile) or die("Cannot read from $ifile");
open(OUT, ">$ofile") or die("Cannot write to $ofile");

while($line = <IN>) {
    chomp($line);
    if($line =~ /kbroman_presentation/) {
        $line =~ s/\/\* //;
        $line =~ s/ \*\///;
    }
    if($line =~ /invisiblelink/) {
        $line =~ s/\<\!\-\-//;
        $line =~ s/\-\-\>//;
    }
    if($line =~ /Remove stickies/) {
        $line = "<!-- $line -->";
    }
    print OUT "$line\n";
}
