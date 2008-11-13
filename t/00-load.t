#!/usr/bin/env perl

use Test::More tests => 2;

BEGIN {
    use_ok('App::ZofCMS');
	use_ok( 'App::ZofCMS::Plugin::Sub' );
}

diag( "Testing App::ZofCMS::Plugin::Sub $App::ZofCMS::Plugin::Sub::VERSION, Perl $], $^X" );
