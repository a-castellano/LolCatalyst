requires 'Devel::Cover::Report::Codecov', 0.22;
requires 'Catalyst::Runtime';
requires 'Catalyst::Plugin::ConfigLoader';
requires 'Catalyst::Plugin::Static::Simple';
requires 'Catalyst::Action::RenderView';
requires 'Catalyst::View::TT';
requires 'Catalyst::View::JSON';
requires 'Catalyst::Plugin::Unicode';
requires 'Moose';
requires 'namespace::autoclean';
requires 'Config::General';
requires 'Acme::LOLCAT';

recommends 'Pod::Usage';

on test => sub {
    requires 'Test::More', 1.302120;
    requires 'Test::Class', 0.50;
    requires 'Test::MockModule', 0.13;
    requires 'Devel::Mutator', 0.03;
};
