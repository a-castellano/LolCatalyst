use strict;
use warnings;
use Test::More qw(no_plan);
use LolCatalyst::Lite::Translator;

ok(
    (my $tr = LolCatalyst::Lite::Translator->new),
        'Constructed translator object ok'
  );

my $input = 'hello world';
my $scrambled = $tr->translate_to('Scramble', $input);

like($scrambled, qr/h...o w...d/, 'text matches first/last');
isnt($scrambled, $input, 'text altered');
