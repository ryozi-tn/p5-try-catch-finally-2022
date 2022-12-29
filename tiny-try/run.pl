use strict;
use warnings;
use Try::Tiny;

try {
    die "dead";
} catch {
    print "catch: $_";
};


sub do_something{
    try {
        return "OK";
    } catch {
        print "catch: $_";
    }; 
    print "Unreachable code?\n";
}

do_something();

print "END\n";

__END__

Output(stdout/stderr)
--------------
catch: dead at ./run.pl line 6.
Unreachable code?
END