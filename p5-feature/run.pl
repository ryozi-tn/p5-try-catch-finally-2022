use strict;
use warnings;
use feature qw(try);

try {
    die "dead";
} catch($e) {
    print "catch: $e";
} finally {
    print "finally\n";
}

sub do_something{
    try {
        return "OK";
    } catch($e) {
        print "catch: $e";
    } finally {
        print "finally\n";
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
try/catch/finally is experimental at ./run.pl line 9.
try/catch is experimental at ./run.pl line 14.
try/catch is experimental at ./run.pl line 16.
try/catch/finally is experimental at ./run.pl line 18.
catch: dead at ./run.pl line 6.
finally
finally
END