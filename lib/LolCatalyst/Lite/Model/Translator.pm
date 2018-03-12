# commitmsg: hook external translator model back up to the app
# lib/LolCatalyst/Lite/Model/Translator.pm
package LolCatalyst::Lite::Model::Translator;

use strict;
use warnings;
use parent 'Catalyst::Model::Adaptor';

__PACKAGE__->config(
    class => 'LolCatalyst::Lite::Translator',
    args  => {},

);

1;
