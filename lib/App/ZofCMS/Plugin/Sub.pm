package App::ZofCMS::Plugin::Sub;

use warnings;
use strict;

our $VERSION = '0.0102';

sub new { bless {}, shift }

sub process {
    my ( $self, $template, $query, $config ) = @_;
    my $sub = $template->{plug_sub} ? $template->{plug_sub} : $config->conf->{plug_sub};
    return
        unless defined $sub;

    delete $template->{plug_sub};
    delete $config->conf->{plug_sub};

    $sub->( $template, $query, $config );
}

1;
__END__

=encoding utf8

=head1 NAME

App::ZofCMS::Plugin::Sub - plugin to execute a subroutine, i.e. sub with priority setting

=head1 SYNOPSIS

In your Main Config File or ZofCMS Template file:

    plugins => [ { Sub => 1000 }, ], # set needed priority
    plug_sub => sub {
        my ( $template, $query, $config ) = @_;
        # do stuff
    }

=head1 DESCRIPTION

The module is a plugin for L<App::ZofCMS> that allows you to execute a sub... by setting
plugin's priority setting you, effectively, can set the priority of the sub. Not much but I
need this.

This documentation assumes you've read L<App::ZofCMS>, L<App::ZofCMS::Config> and L<App::ZofCMS::Template>

=head1 MAIN CONFIG FILE AND ZofCMS TEMPLATE FIRST-LEVEL KEYS

=head2 C<plugins>

    plugins => [ { Sub => 1000 }, ], # set the needed priority here

You obviously need to add the plugin in the list of plugins to exectute. Since the entire
purpose of this plugin is to execute the sub with a certain priority setting, you'd set
the appropriate priority in the plugin list.

=head2 C<plug_sub>

    plug_sub => sub {
        my ( $template, $query, $config ) = @_;
    }

Takes a subref as a value.
The plugin will not run unless C<plug_sub> first-level key is present in either Main Config
File or ZofCMS Template file. If the key is specified in both files, the sub set in
ZofCMS Template will take priority. The sub will be executed when plugin is run. The
C<@_> will contain (in that order): ZofCMS Template hashref, query parameters hashref
where keys are parameter names and values are their values, L<App::ZofCMS::Config> object.

=head1 AUTHOR

'Zoffix, C<< <'zoffix at cpan.org'> >>
(L<http://zoffix.com/>, L<http://haslayout.net/>, L<http://zofdesign.com/>)

=head1 BUGS

Please report any bugs or feature requests to C<bug-app-zofcms-plugin-sub at rt.cpan.org>, or through
the web interface at L<http://rt.cpan.org/NoAuth/ReportBug.html?Queue=App-ZofCMS-Plugin-Sub>.  I will be notified, and then you'll
automatically be notified of progress on your bug as I make changes.

=head1 SUPPORT

You can find documentation for this module with the perldoc command.

    perldoc App::ZofCMS::Plugin::Sub

You can also look for information at:

=over 4

=item * RT: CPAN's request tracker

L<http://rt.cpan.org/NoAuth/Bugs.html?Dist=App-ZofCMS-Plugin-Sub>

=item * AnnoCPAN: Annotated CPAN documentation

L<http://annocpan.org/dist/App-ZofCMS-Plugin-Sub>

=item * CPAN Ratings

L<http://cpanratings.perl.org/d/App-ZofCMS-Plugin-Sub>

=item * Search CPAN

L<http://search.cpan.org/dist/App-ZofCMS-Plugin-Sub>

=back

=head1 COPYRIGHT & LICENSE

Copyright 2008 'Zoffix, all rights reserved.

This program is free software; you can redistribute it and/or modify it
under the same terms as Perl itself.


=cut

