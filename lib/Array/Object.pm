package Array::Object;

our $VERSION = 0.01;

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
# STATIC METHODS
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#

sub new
{
    my ($class, $array) = @_;

    my $self = ref $class || $class;

    bless { _array_ref => $array }, $self;       

}

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
# PUBLIC METHODS 
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#

sub array
{
    my ($self, $index, $value) = @_;

    if ( $index && $value) 
    {
        $self->{_array_ref}->[$index] = $value;
    }

    return $self->{_array_ref};
}

sub each
{
    my ($self, $lambda) = @_;

    my $index = 0;
    for my $element(@{$self->{_array_ref}}) 
    {
        &{$lambda}($self, $index, $element);     
        $index++;
    }

    return $self;
}

sub grep
{
    my ($self, $regex) = @_;

    return __PACKAGE__->new([grep {/$regex/} @{$self->{_array_ref}}]);

}

1;

__END__

=head1 NAME

Array::Object

=head1 Synopsis

my $array = Array::Object->new([1,2,3,4]);

$array->each(sub{
    ...
});

=head1 DESCRIPTION

An array class to manage arrays in a more OOP like fashion.

=head1 METHODS

=head2 array

=head2 each

=head2 grep

=head1 AUTHOR

Logan Bell
http://loganbell.org

=head1 THIS DISTRIBUTION

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program. If not, see <http://www.gnu.org/licenses/>.

=cut


