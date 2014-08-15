#!/volume/perl/bin/perl -w

use warnings; 
use MIME::Base64;
use REST::Client;
use Data::Dumper;
use JSON;
 
 # Set the request parameters
 my $host = 'http://10.94.196.96:12900';
 my $user = 'admin';
 my $pwd = 'Embe1mpls';
 my $headers = {Accept => 'application/json', Authorization => 'Basic ' . encode_base64($user . ':' . $pwd)};

 
 #Create a request with basic authentication
 my $client = REST::Client->new(host => $host); 

 
 # use GET method to get list of sources
 $client->GET("/sources", $headers);
 
 # Get response code and content 
 print 'Response status: ' . $client->responseCode() . "\n\n";  
 print 'Response: ' . $client->responseContent() . "\n\n\n";

 #Retrieving values from keys using Json
 print Dumper $text = decode_json($client->responseContent());
# print "Number of messages recored by dc-st-pdt-si17-lf0.dcbg.juniper.net-->" .  
        $text->{'sources'}->{'dc-st-pdt-si17-lf0.dcbg.juniper.net'}. "\n\n";
 print "Retrieving time(took_ms) only-->". $text->{'took_ms'}. "\n\n";

print "-----------------------------------\n";
print "-----------------------------------\n";

=for
# use GET method to get list of sources
 $client->GET("/count/total", $headers);

 # Get response code and content
 print 'Response status: ' . $client->responseCode() . "\n\n";
 print 'Response: ' . $client->responseContent() . "\n\n\n";

 #Retrieving values from keys using Json
 print Dumper $text = decode_json($client->responseContent());
 print "Total events recorded-->" . $text->{'events'}. "\n\n";
=cut
 
 #foreach ( $client->responseHeaders() ) {
 #  print 'Header: ' . $_ . '=' . $client->responseHeader($_) . "\n";
 #}
