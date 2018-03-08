package LolCatalyst::Lite::Model::Translate;
use Moose;
use namespace::autoclean;
use Acme::LOLCAT ();

extends 'Catalyst::Model';

=head1 NAME

LolCatalyst::Lite::Model::Translate - Catalyst Model

=head1 DESCRIPTION

Catalyst Model.


=encoding utf8

=head1 AUTHOR

acastellano,,,

=head1 LICENSE

This library is free software. You can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

sub translate {
    my ( $self, $text ) = @_;
    return Acme::LOLCAT::translate($text);

}

__PACKAGE__->meta->make_immutable;

1;
