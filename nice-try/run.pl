use strict;
use warnings;
use Nice::Try;

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
catch: dead at ./run.pl line 6.finally
finally
Unreachable code?
END