# commitmsg: initial external translator object and test
# lib/LolCatalyst/Lite/Translator.pm
package LolCatalyst::Lite::Translator;

use Moose;
use namespace::clean -except => 'meta';

has 'default_target' => (
    is       => 'ro',
    isa      => 'Str',
    required => 1,
    default  => 'LOLCAT'
);

has 'translators' => (
    is         => 'ro',
    isa        => 'HashRef',
    lazy_build => 1
);

sub _build_translators {
    my ($self) = @_;
    return { LOLCAT => LolCatalyst::Lite::Translator::LOLCAT->new };
}

sub translate {
    my ( $self, $text ) = @_;
    $self->translate_to( $self->default_target, $text );
}

sub translate_to {
        my ($self, $target, $text) = @_;
            $self->translators->{$target}->translate($text);
}

__PACKAGE__->meta->make_immutable;
1;
