package Mojo::JSON::Bool;

use strict;
use warnings;

use overload (
    '0+' => sub { $_[0]->value },
    '""' => sub { $_[0]->value },
);

sub new {
    my $class = shift;
    my $value = $_[0] ? 1 : 0;
    return bless { value => $value }, $class;
}

sub value {
    my $self = shift;
    if (@_) {
        $self->{value} = $_[0] ? 1 : 0;
        return $self;
    }
    else {
        return $self->{value};
    }
}

sub false() { Mojo::JSON::Bool->new(0) }
sub true()  { Mojo::JSON::Bool->new(1) }

sub json_false() { Mojo::JSON::Bool->new(0) }
sub json_true()  { Mojo::JSON::Bool->new(1) }

1;
