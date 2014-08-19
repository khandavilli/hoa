package My::Tool; 

use UNIVERSAL::can;

sub get_coderefs_href ($) {  # get hashref of all coderefs in package
   my $pkg=shift;
   my $rv;
   no strict 'refs';
   my $stash = $pkg . '::';
   for my $name (keys %$stash ) {
      my $sub = $pkg->can( $name );   # use UNIVERSAL::can
      next unless defined $sub;
      
      my $proto = prototype( $sub );
      next if defined $proto and length($proto)==0;
      $rv->{$name}++;
   }
   $rv;
}
    


1;
