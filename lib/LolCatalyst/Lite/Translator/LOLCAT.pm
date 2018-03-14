package LolCatalyst::Lite::Translator::Driver::LOLCAT;

use Moose;
use Acme::LOLCAT ();
use namespace::clean -except => 'meta';

with 'LolCatalyst::Lite::Interface::TranslationDriver';

sub translate {
    my ( $self, $text ) = @_;
    return Acme::LOLCAT::translate($text);
}

__PACKAGE__->meta->make_immutable;

1;
