#!/usr/bin/perl
#
# killsig: delete signature (also "oe-sigs") when quoting emails.
#          known patterns: ">-- " , "> -- ", ">--", "> --".
#
# Michael Velten <michael@michnet.de>
# http://www.michnet.de/mutt/#signature

open(MAIL, "+<$ARGV[0]") || die "$0: Can't open $ARGV[0]: $!";
while (<MAIL>) {
	unless (/^> ?-- ?$/) {
		push(@purged, $_);
	}
	else {
		while (<MAIL>) {
			push(@purged, $_) unless /^>.+/;
		}
	}
}
truncate(MAIL, 0);
seek(MAIL,0,0);
print MAIL @purged;
close(MAIL);
