# Before `make install' is performed this script should be runnable with
# `make test'. After `make install' it should work as `perl 1.t'

#########################

use Test::Simple tests => 3;

use String::CRC::Cksum qw(cksum);

my ($x, $y) = cksum 'abcde';
ok($x == 996742021 && $y == 5, 'basic algorithm');

my ($Usum, $Ucount) = split /\s+/, `cksum < /etc/profile`;
ok(open(PFD, "< /etc/profile"), 'opening /etc/profile for testing');

($x, $y) = cksum(\*PFD);
ok($x == $Usum && $y == $Ucount, 'reading filehandle');
