
{
    package Quick::Logging; 

    use Data::Dumper;

    sub log {
        my $message = shift; 
        my $level   = shift;  

        print "Quick::Logging - $level - $message\n";

        return 1;
    }
    
}

{
    package QuickLogging;

    sub log {
        my %args = ( @_ );
        
        my $message = shift; 
        my $level   = shift;  

        print "QuickLogging - $level - $message\n";

        return 1;
    }
    
    sub print_my_args {
    
        ## print Dumper \@_; 
   
    } 
    
    sub my_third_subroutine {
    
        return 1;
    }
}

1;
