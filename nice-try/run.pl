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


print "# try-caller\n";
(sub{ 
    try { 
        print caller(), "\n";
     }catch($e){print "catch: Unreachable code\n";} finally {print "finally\n";}
})->();

print "# catch-caller\n";
(sub{ 
    try { die "DAAI" }catch($e){ 
        print caller(), "\n"; 
    } finally {print "finally\n";}
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
Use of uninitialized value in print at ./run.pl line 33.
Use of uninitialized value in print at ./run.pl line 33.
Use of uninitialized value in print at ./run.pl line 33.
Use of uninitialized value in print at ./run.pl line 33.
Use of uninitialized value in print at ./run.pl line 40.
Use of uninitialized value in print at ./run.pl line 40.
Use of uninitialized value in print at ./run.pl line 40.
Use of uninitialized value in print at ./run.pl line 40.
Exiting subroutine via last at ./run.pl line 56.
Exiting eval via last at ./run.pl line 56.
Exiting subroutine via redo at ./run.pl line 65.
Exiting eval via redo at ./run.pl line 65.
# try-return (use return value)
finally
# try-return (no use return value)
finally
Unreachable code?
# catch-return (use return value)
finally
# catch-return (no use return value)
finally
Unreachable code?
# try-caller
main./run.pl35main::__ANON__12018UUUUUUUUUUUUU
finally
# catch-caller
main./run.pl42main::__ANON__12018UUUUUUUUUUUUU
finally
# catch-die
# last label
# redo label
finally
OK
FINISH