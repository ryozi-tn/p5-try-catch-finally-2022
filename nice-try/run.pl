use strict;
use warnings;
use Nice::Try;

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
catch: dead at ./run.pl line 6.catch: dead at ./run.pl line 12.END