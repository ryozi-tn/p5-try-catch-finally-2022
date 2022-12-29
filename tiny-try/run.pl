use strict;
use warnings;
use Try::Tiny;

try {
    die "dead";
} catch {
    print "catch: $_";
};

try {
    die "dead";
} catch {
    print "catch: $_";
}; 


print "END\n";

__END__

Output(stdout/stderr)
--------------
catch: dead at ./run.pl line 6.
catch: dead at ./run.pl line 12.
END