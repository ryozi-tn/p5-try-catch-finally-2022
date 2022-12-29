use strict;
use warnings;
use Try::Harder;

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
# catch-return (use return value)
finally
# catch-return (no use return value)
finally
# catch-die
finally
# last label
finally
# redo label
finally
finally
                # <= OKが出てない
FINISH