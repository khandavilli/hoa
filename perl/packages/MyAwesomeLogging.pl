#!/volume/perl/bin/perl -w

use strict;
use warnings; 

## Load my Library
use MyAwesomeLoggingLib;

## start of my programe

print MyAwesomeLoggingLib::Quick::Logging::log( 'INFO', 'my first message' ); 

exit;



