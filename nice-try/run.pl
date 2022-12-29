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

# 戻り値を使う
print "# using return value\n";
print "do_something: ", do_something(), "\n";

# 戻り値を使わない場合、なぜか`print "Unreachable code?\n";` が実行される
print "# not using return value\n";
do_something();


print "END\n";

__END__

Output(stdout/stderr)
--------------
catch: dead at ./run.pl line 6.finally
# using return value
finally
do_something: OK
# not using return value
finally
Unreachable code?
END