package LolCatalyst::Lite::Translator;

use Module::Pluggable::Object;
use Moose;
use aliased 'LolCatalyst::Lite::Interface::TranslationDriver';
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
    my $base = __PACKAGE__ . '::Driver';

    my $mp = Module::Pluggable::Object->new( search_path => [$base] );
    my @classes = $mp->plugins;

    my %translators;
    foreach my $class (@classes) {
        Class::MOP::load_class($class);
        unless ( $class->does(TranslationDriver) ) {
            confess
"Class ${class} in ${base}:: namespace does not implement Translation Driver interface";
        }
        ( my $name = $class ) =~ s/^\Q${base}::\E//;
        $translators{$name} = $class->new;
    }
    return \%translators;
}

sub translate {
    my ( $self, $text ) = @_;
    $self->translate_to( $self->default_target, $text );
}

sub translate_to {
    my ( $self, $target, $text ) = @_;
    $self->translators->{$target}->translate($text);
}

__PACKAGE__->meta->make_immutable;
1;
