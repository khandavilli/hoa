#!/volume/perl/bin/perl -w

use strict;
use lib qw(/volume/labtools/lib);
use lib qw(/homes/dgarros/FAN/lib);

use Data::Dumper;

use Carp;
use Getopt::Long;
use Net::Netconf::Manager;

my %opt;
GetOptions(     't:s'           => \$opt{'target'},
                'l:s'           => \$opt{'login'},
                'p:s'           => \$opt{'password'},
                'h|help'        => \$opt{'h'},
            );

## make sure mandatory parameters are provided
die "Target must be provided"       if ( not defined $opt{'target'} ); 

$opt{'login'}       = 'root'        if ( not defined $opt{'login'} );
$opt{'password'}    = 'Embe1mpls'   if ( not defined $opt{'password'} );

# Now create the device information to send to Net::Netconf::Manager

my %deviceinfo = (
        access    => 'ssh',
        login     => $opt{'login'},
        password  => $opt{'password'},
        hostname  => $opt{'target'},
        port      => 22,
        ## server    => 'netconf',
);

# connect to the Netconf server
my $jnx = new Net::Netconf::Manager(%deviceinfo);
unless ( ref $jnx ) {
    croak "ERROR: $deviceinfo{hostname}: failed to connect.\n";
}

print "$opt{'target'} | Session opened\n";
    
my $rpc2    = "<rpc><get-software-information/></rpc>";
my $rpc3    = "<rpc><command>show version</command></rpc>";

my $res = $jnx->send_and_recv_rpc( $rpc2 );

print "=======================\n";
print $res;


# See if you got an error
if ($jnx->has_error) {
    croak "ERROR: in processing request \n $jnx->{'request'} \n";
} 

