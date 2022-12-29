use strict;
use warnings;
use feature qw(try);

try {
    die "dead";
} catch($e) {
    print "catch: $e";
} 

try {
    die "dead";
} catch($e) {
    print "catch: $e";
} 


print "END\n";

__END__

Output(stdout/stderr)
--------------
try/catch is experimental at ./run.pl line 5.
try/catch is experimental at ./run.pl line 7.
try/catch is experimental at ./run.pl line 11.
try/catch is experimental at ./run.pl line 13.
catch: dead at ./run.pl line 6.
catch: dead at ./run.pl line 12.
END