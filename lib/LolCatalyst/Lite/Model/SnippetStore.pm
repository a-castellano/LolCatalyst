package LolCatalyst::Lite::Model::SnippetStore;

use strict;
use warnings;

use aliased 'LolCatalyst::Lite::SnippetStore';

sub COMPONENT { SnippetStore->new }


1;
