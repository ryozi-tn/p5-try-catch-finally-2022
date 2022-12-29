use strict;
use warnings;
use feature qw(try);

try {
    die "dead";
} catch($e) {
    print "catch: $e";
} 

sub do_something{
    try {
        return "OK";
    } catch($e) {
        print "catch: $e";
    }
    print "Unreachable code?\n";
}

do_something();

print "END\n";

__END__

Output(stdout/stderr)
--------------
try/catch is experimental at ./run.pl line 5.
try/catch is experimental at ./run.pl line 7.
try/catch is experimental at ./run.pl line 12.
try/catch is experimental at ./run.pl line 14.
catch: dead at ./run.pl line 6.
END