#!/volume/perl/bin/perl -w

use strict;
use warnings; 

use lib '../lib'; 

use ToolBox;

use Data::Dumper;

## Load my Library
use MyAwesomeLoggingLib;

## start of my program
print ' -------- Dumper \@INC ------------ '."\n";  
print Dumper \@INC;


print ' -------- Dumper \%INC ------------ '."\n";  
print Dumper \%INC;

# print ' -------- Dumper \%ENV ------------ '."\n";  
# print Dumper \%ENV;

print ' -------- Dumper My::Tool::get_coderefs_href( QuickLogging ) ------------ '."\n";  
print Dumper My::Tool::get_coderefs_href( 'QuickLogging' );

exit;



