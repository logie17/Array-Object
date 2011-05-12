use strict;
use warnings;

use Test::More tests => 2;                   

BEGIN{ use_ok('Array::Object'); }

my $subject = Array::Object->new([1,2,3,4]);

is_deeply $subject->grep('1')->array, [1];
