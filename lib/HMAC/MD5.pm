package HMAC::MD5;

# Copyright (c) 1998 Clinton Wong. All rights reserved.
# This program is free software; you can redistribute it
# and/or modify it under the same terms as Perl itself. 

use strict;
use vars qw($VERSION @ISA @EXPORT);
require Exporter;
require AutoLoader;
@ISA = qw(Exporter AutoLoader);
@EXPORT = qw();
use MD5;

$VERSION = '0.01';

sub hash {
  my ($the_string, $key) = @_;

  if ( length($key) > 64) { $key = new MD5->hash($key) }

  my $ipad =xor_string_max_64($key, 0x36);
  my $opad =xor_string_max_64($key, 0x5c);

  new MD5->hash($opad . (new MD5->hash($ipad . $the_string)));
}

sub hexhash {
  unpack("H*", hash(@_));
}

sub xor_string_max_64 {
  my ($string, $xor_with) = @_;
  my @ASCII = unpack("C*", $string);
  my $i;

  for ($i=0; $i<=$#ASCII; $i++) { $ASCII[$i] =  $ASCII[$i] ^ $xor_with }
  if ($#ASCII < 63) {
    for ($i=$#ASCII+1; $i<=63; $i++) { $ASCII[$i] = $xor_with }
  }
  pack("C*", @ASCII);
}


# examples from RFC 2104 that work.  Uncomment to see for yourself.

#print hexhash("Hi There" , chr(11) x 16), " should be 9294727a3638bb1c13f48ef8158bfc9d\n";

#print hexhash("what do ya want for nothing?", "Jefe"), " should be 750c783e6ab0b503eaa86e310a5db738\n";

#print hexhash( chr(221) x 50 , chr(170) x 16 ), " should be 56be34521d144c88dbb8c733f0e8b3f6\n";

1;
__END__

=head1 NAME

HMAC::MD5 - Perl module to compute an HMAC digest using MD5

=head1 SYNOPSIS

 use HMAC::MD5;
 hex($string, $key) returns a 16 byte digest in binary form.
 hexhash($string, $key) returns a 16 byte digest as printable hex.

=head1 DESCRIPTION

 This module computes an HMAC MD5 digest as specified by RFC 2104.

=head1 EXAMPLE

 use HMAC::MD5;
 print HMAC::MD5::hexhash("what do ya want for nothing?", "Jefe"),
       " should be 750c783e6ab0b503eaa86e310a5db738\n";

=head1 SEE ALSO

 RFC 2104

=head1 AUTHOR

 Clinton Wong, clintdw@netcom.com

=head1 COPYRIGHT
 
 The HMAC::MD5 module is Copyright (c) 1998 Clinton Wong.
 All rights reserved.  This program is free software; you
 can redistribute it and/or modify it under the same terms
 as Perl itself.

 HMAC::MD5 uses the MD5 module, which is Copyright (C) 1991-2,
 RSA Data Security, Inc. Created 1991. All rights reserved.
 See the MD5 module's documentation for full copyright and
 license information.

=cut

