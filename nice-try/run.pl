use strict;
use warnings;
use Nice::Try;

print "# try-return (use return value)\n";
$_ = (sub{ 
    try { return "OK" }catch{print "catch: Unreachable code\n";} finally {print "finally\n";} 
    print "Unreachable code?\n";
})->();

print "# try-return (no use return value)\n";
(sub{ 
    try { return "OK" }catch{print "catch: Unreachable code\n";} finally {print "finally\n";}
    print "Unreachable code?\n";
})->();

print "# catch-return (use return value)\n";
$_ = (sub{ 
    try { die "DAAI" }catch{ return "OK" } finally {print "finally\n";} 
    print "Unreachable code?\n";
})->();

print "# catch-return (no use return value)\n";
(sub{ 
    try { die "DAAI" }catch{ return "OK" } finally {print "finally\n";}
    print "Unreachable code?\n";
})->();

print "# catch-die\n";
(sub{ 
    eval{
        try { die "DAAI" }catch{ die "DAAAAAAAAAAAAAAI" } finally {print "finally\n";}
        print "Unreachable code?\n";
    };
})->();

print "# last label\n";
(sub{
    LOOP: {
        try { for(my $i=0; $i<3; ++$i){ last LOOP if $i == 2; } } catch {print "catch: Unreachable code\n";} finally {print "finally\n";}
        print "Unreachable code\n";
    }
})->();

print "# redo label\n";
(sub{ 
    my $cnt = 0;
    REDO: {
        try { redo REDO if ++$cnt != 2;} catch { print "catch: Unreachable code\n"; } finally {print "finally\n";}
        print "OK\n";
    }
})->();

print "FINISH\n";

__END__

Output(stdout/stderr)
--------------
# try-return (use return value)
finally
# try-return (no use return value)
finally
Unreachable code?        # <= ダメ
# catch-return (use return value)
finally
# catch-return (no use return value)
finally
Unreachable code?        # <= ダメ
# catch-die
        # <= finallyが呼ばれてない
# last label
Exiting subroutine via last at ./run.pl line 40.        # <= ダメ
Exiting eval via last at ./run.pl line 40.
        # <= finallyが呼ばれてない
# redo label
Exiting subroutine via redo at ./run.pl line 49.        # <= ダメ
Exiting eval via redo at ./run.pl line 49.
finally
        # <= finallyが1つ足りない？
OK
FINISH