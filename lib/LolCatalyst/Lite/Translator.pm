# commitmsg: initial external translator object and test
# lib/LolCatalyst/Lite/Translator.pm
package LolCatalyst::Lite::Translator;

use Moose;
use Acme::LOLCAT ();
use namespace::clean -except => 'meta';

sub translate {
    my ( $self, $text ) = @_;
    return Acme::LOLCAT::translate($text);

}

__PACKAGE__->meta->make_immutable;
1;
