use strict;
use warnings;
use Nice::Try;

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
catch: dead at ./run.pl line 6.Unreachable code?
END