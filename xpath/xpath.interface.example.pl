#!/volume/perl/bin/perl -w

#use strict;
#use warnings;

use XML::XPath;

my $xmlfile = $ARGV[0];

my $lxp1    = XML::XPath->new(filename => $xmlfile);

foreach my $int ($lxp1->find('//logical-interface[contains( name, "xe-")]')->get_nodelist) {
	
    my $name = $int->find('name')->string_value;
    my $p_name = $int->find('../name')->string_value;
    
    print "$name | $p_name \n";
}
