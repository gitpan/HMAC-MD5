# Before `make install' is performed this script should be runnable with
# `make test'. After `make install' it should work as `perl test.pl'

######################### We start with some black magic to print on failure.

# Change 1..1 below to 1..last_test_to_print .
# (It may become useful if the test is moved to ./t subdirectory.)

BEGIN { $| = 1; print "1..8\n"; }
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

if (HMAC::MD5::hexhash(chr(221) x 50, chr(170) x 16) eq
    '56be34521d144c88dbb8c733f0e8b3f6') {
  print "ok 4\n";
} else {
  print "not ok 4\n";
}

if (HMAC::MD5::hexhash(chr(205) x 50, pack("H*",
             "0102030405060708090a0b0c0d0e0f10111213141516171819"))
    eq '697eaf0aca3a3aea3a75164746ffaa79') {
  print "ok 5\n";
} else {
  print "not ok 5\n";
}

if (HMAC::MD5::hexhash("Test With Truncation", chr(12) x 16 ) eq
    '56461ef2342edc00f9bab995690efd4c') {
  print "ok 6\n";
} else {
  print "not ok 6\n";
}

if (HMAC::MD5::hexhash("Test Using Larger Than Block-Size Key - Hash Key First",
     chr(170) x 80 ) eq
    '6b1ab7fe4bd7bf8f0b62e6ce61b9d0cd') {
  print "ok 7\n";
} else {
  print "not ok 7\n";
}

if (HMAC::MD5::hexhash(
   "Test Using Larger Than Block-Size Key and Larger Than One Block-Size Data",
     chr(170) x 80 ) eq
    '6f630fad67cda0ee1fb1f562db3aa53e') {
  print "ok 8\n";
} else {
  print "not ok 8\n";
}

