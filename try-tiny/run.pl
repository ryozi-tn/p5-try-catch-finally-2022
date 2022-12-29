use strict;
use warnings;
use Try::Tiny;


print "# try-return (use return value)\n";
$_ = (sub{ 
    try { return "OK" }catch{print "catch: Unreachable code\n";} finally {print "finally\n";};
    print "Unreachable code?\n";
})->();

print "# try-return (no use return value)\n";
(sub{ 
    try { return "OK" }catch{print "catch: Unreachable code\n";} finally {print "finally\n";};
    print "Unreachable code?\n";
})->();

print "# catch-return (use return value)\n";
$_ = (sub{ 
    try { die "DAAI" }catch{ return "OK" } finally {print "finally\n";};
    print "Unreachable code?\n";
})->();

print "# catch-return (no use return value)\n";
(sub{ 
    try { die "DAAI" }catch{ return "OK" } finally {print "finally\n";};
    print "Unreachable code?\n";
})->();

print "# try-caller\n";
(sub{ 
    try { 
        print caller(), "\n";
     }catch{print "catch: Unreachable code\n";} finally {print "finally\n";};
})->();

print "# catch-caller\n";
(sub{ 
    try { die "DAAI" }catch{ 
        print caller(), "\n"; 
    } finally {print "finally\n";};
})->();

print "# catch-die\n";
(sub{ 
    eval{
        try { die "DAAI" }catch{ die "DAAAAAAAAAAAAAAI" } finally {print "finally\n";};
        print "Unreachable code?\n";
    };
})->();

print "# last label\n";
(sub{
    LOOP: {
        try { for(my $i=0; $i<3; ++$i){ last LOOP if $i == 2; } } catch {print "catch: Unreachable code\n";} finally {print "finally\n";};
        print "Unreachable code\n";
    }
})->();

print "# redo label\n";
(sub{ 
    my $cnt = 0;
    REDO: {
        try { redo REDO if ++$cnt != 2;} catch { print "catch: Unreachable code\n"; } finally {print "finally\n";};
        print "OK\n";
    }
})->();

print "FINISH\n";

__END__

Output(stdout/stderr)
--------------
Exiting subroutine via last at ./run.pl line 55.
Exiting eval via last at ./run.pl line 55.
Exiting subroutine via last at ./run.pl line 55.
Exiting subroutine via redo at ./run.pl line 64.
Exiting eval via redo at ./run.pl line 64.
Exiting subroutine via redo at ./run.pl line 64.
# try-return (use return value)
finally
Unreachable code?
# try-return (no use return value)
finally
Unreachable code?
# catch-return (use return value)
finally
Unreachable code?
# catch-return (no use return value)
finally
Unreachable code?
# try-caller
Try::Tiny/usr/src/app/local/lib/perl5/Try/Tiny.pm102
finally
# catch-caller
Try::Tiny/usr/src/app/local/lib/perl5/Try/Tiny.pm123
finally
# catch-die
finally
# last label
finally
# redo label
finally
finally
OK
FINISH