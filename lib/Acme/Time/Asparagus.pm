package Acme::Time::Asparagus;
use strict;

BEGIN {
    use Exporter();
    use vars qw ($VERSION @ISA @EXPORT @times);
    $VERSION = 1.01;
    @ISA     = qw (Exporter);
    @EXPORT  = qw ( veggietime );

    # Got your own clock with different veggies?
    @times =
      ( 'Tomato',         'Eggplant',    'Carrot',
        'Garlic',         'Green Onion', 'Pumpkin',
        'Asparagus',      'Onion',       'Corn',
        'Brussel Sprout', 'Red Pepper',  'Cabbage',
    );
}

=head1 NAME

Acme::Time::Asparagus - Time on the vegetable clock

=head1 SYNOPSIS

  use Acme::Time::Asparagus;
  print veggietime('12:40');

=head1 DESCRIPTION

Figures out time on the vegetable clock. See
http://www.DrBacchus.com/images/clock.jpg

=head1 BUGS

I suppose one could consider the very existence of this module to be a
bug. Also, I have never been quite sure if that thing was a brussel
sprout or a cauliflower.

It might be nice to have some error checking to trap bogus times.

Make it easier to extend for use with other varieties of clocks.

Some way to convert back to "real" time from vegetable notation.

Find some way to work in some obscure Veggie Tales quotes.

=head1 SUPPORT

You're kidding, right?

=head1 AUTHOR

	Rich 'DrBacchus' Bowen
	CPAN ID: RBOW
	rich@DrBacchus.com
    http://www.DrBacchus.com/
	http://www.CooperMcGregor.com/

=head1 COPYRIGHT

Copyright (c) 2002 Rich Bowen. All rights reserved.
This program is free software; you can redistribute
it and/or modify it under the same terms as Perl itself.

The full text of the license can be found in the
LICENSE file included with this module.

=head1 veggietime

    print veggietime('5:17');

Returns the veggie time equivalent of a 12-hour time expressed in the
format hh:mm. Will round to the nearest vegetable. Does no error
checking at this time.

=cut

sub veggietime {
    my $time = shift;
    my ($h, $m) = split /:/, $time;

    my $v = (int($m/5 + 0.5));

    if ($v == 0) {
        return $times[$h - 1];
    } else {
        return $times[$v - 1] . ' past ' . $times[$h - 1];
    }
}

# Look. It's a water buffalo!

1; 


