package LolCatalyst::Lite::Controller::Root;
use Moose;
use namespace::autoclean;

BEGIN { extends 'Catalyst::Controller' }

#
# Sets the actions in this controller to be registered with no prefix
# so they function identically to actions created in MyApp.pm
#
__PACKAGE__->config( namespace => '' );

=encoding utf-8

=head1 NAME

LolCatalyst::Lite::Controller::Root - Root Controller for LolCatalyst::Lite

=head1 DESCRIPTION

[enter your description here]

=head1 METHODS

=head2 index

The root page (/)

=cut

sub index : Path : Args(0) {
    my ( $self, $c ) = @_;
}

sub add : Local { }

=head2 default

Standard 404 error page

=cut

sub default : Path {
    my ( $self, $c ) = @_;
    $c->response->body('Page not found');
    $c->response->status(404);
}

sub translate : Local {
    my ( $self, $c ) = @_;
    my $lol = $c->req->body_params->{lol};    # only for a POST request
         # $c->req->params->{lol} would catch GET or POST
         # $c->req->query_params would catch GET params only
    $c->stash(
        lol      => $lol,
        result   => $c->model('Translator')->translate($lol),
        template => 'index.tt',
    );
}

=head2 end

Attempt to render a view, if needed.

=cut

sub end : ActionClass('RenderView') {
    my ( $self, $c ) = @_;
    my $errors = scalar @{ $c->error };
    if ($errors) {
        $c->res->status(500);
        $c->res->body('internal server error');
        $c->clear_errors;
    }
}

sub translate_service : Local {
    my ( $self, $c ) = @_;
    $c->forward('translate');
    $c->stash->{current_view} = 'Service';

}

sub auto : Private {
    my ( $self, $c ) = @_;
    $c->authenticate;

}

=head1 AUTHOR

Álvaro Castellano Vela

=head1 LICENSE

This library is free software. You can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

__PACKAGE__->meta->make_immutable;

1;
