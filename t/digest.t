# Before `make install' is performed this script should be runnable with
# `make test'. After `make install' it should work as `perl test.pl'

######################### We start with some black magic to print on failure.

# Change 1..1 below to 1..last_test_to_print .
# (It may become useful if the test is moved to ./t subdirectory.)

BEGIN { $| = 1; print "1..3\n"; }
END {print "not ok 1\n" unless $loaded;}
use HMAC::MD5;
$loaded = 1;
print "ok 1\n";

######################### End of black magic.

# Insert your test code below (better if it prints "ok 13"
# (correspondingly "not ok 13") depending on the success of chunk 13
# of the test code):

if (HMAC::MD5::hexhash("Hi There" , chr(11) x 16) eq
    '9294727a3638bb1c13f48ef8158bfc9d') {
  print "ok 2\n";
} else {
  print "not ok 2\n";
}

if (HMAC::MD5::hexhash("what do ya want for nothing?", "Jefe") eq
    '750c783e6ab0b503eaa86e310a5db738') {
  print "ok 3\n";
} else {
  print "not ok 3\n";
}

