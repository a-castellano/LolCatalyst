use strict;
use warnings;
use Test::More qw(no_plan);
use Test::Exception;

use_ok "LolCatalyst::Lite::SnippetStore";

dies_ok {
    LolCatalyst::Lite::SnippetStore->new;
}
'Create without translator object fails';

my $store = LolCatalyst::Lite::SnippetStore->new( translator => 'DUMMY' );

my $num_snips = 3;

ok(
    (
        my @snip = map $store->create( { text => "snippet $_" } ),
        1 .. $num_snips
    ),
    'Creates ok'
);

cmp_ok( scalar(@snip), '==', $num_snips, "$num_snips created" );
is_deeply( \@snip, [ $store->all ], 'deep snippet check' );
foreach my $snip (@snip) {
    my $id = $snip->{id};
    is( $snip->{text}, $store->find($id)->{text}, "find by id $id ok" );
}
