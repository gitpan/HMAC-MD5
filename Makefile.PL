use ExtUtils::MakeMaker;
# See lib/ExtUtils/MakeMaker.pm for details of how to influence
# the contents of the Makefile that is written.

print "Checking for MD5... ";
eval {
    require MD5;
};
if ($@) {
    print " failed\n";
    print <<EOT;
HMAC::MD5 requires MD5 to compute the HMAC digest.  Please install
the MD5 module.  See http://www.perl.com/CPAN/ for details.

EOT
    exit;
}

print "\n\n";

WriteMakefile(
    'NAME'      => 'HMAC::MD5',
    'VERSION_FROM' => 'lib/HMAC/MD5.pm', # finds $VERSION
);


