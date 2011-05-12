use strict;
use warnings;

use Test::More tests => 4;                      # last test to print
BEGIN{ use_ok('Array::Object'); }

my $subject = Array::Object->new([1,2,3,4]);

my @empty;
$subject->each(sub{
    push @empty, $_[2];    
});

is_deeply \@empty, [1,2,3,4];

is_deeply $subject->each(sub{
    my ($self, $index, $value) = @_;
    $self->array($index, ($value * 2));
})->array, [1,4,6,8];

my $array_ref = $subject->array;
is_deeply $array_ref, [1,4,6,8];


