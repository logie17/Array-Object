package Array::Object;

sub new
{
    my ($class, $array) = @_;

    my $self = ref $class || $class;

    bless { _array_ref => $array }, $self;       

}

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
