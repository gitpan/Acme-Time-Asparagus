package Acme::Time::Asparagus;
use strict;

BEGIN {
    use Exporter();
    use vars qw ($VERSION @ISA @EXPORT %times $errstr);
    $VERSION = 1.04;
    @ISA     = qw (Exporter);
    @EXPORT  = qw ( veggietime $errstr );

    # Got your own clock with different veggies?
    $times{'en_US'} =
      [ 'Tomato',         'Eggplant',    'Carrot',
        'Garlic',         'Green Onion', 'Pumpkin',
        'Asparagus',      'Onion',       'Corn',
        'Brussel Sprout', 'Red Pepper',  'Cabbage',
    ];

    # You say tomato, I say tomato
    $times{'en_GB'} =
      [ 'Tomato',         'Aubergine',    'Carrot',
        'Garlic',         'Spring Onion', 'Pumpkin',
        'Asparagus',      'Onion',        'Sweetcorn',
        'Brussel Sprout', 'Red Pepper',   'Cabbage',
    ];
}

=head1 NAME

Acme::Time::Asparagus - Time on the vegetable clock

=head1 SYNOPSIS

  use Acme::Time::Asparagus;
  print veggietime('12:40', 'en_GB');

=head1 DESCRIPTION

"And now it's time for silly songs with Larry."

Figures out time on the vegetable clock. See
http://www.DrBacchus.com/images/clock.jpg

=head1 BUGS/ToDo

I suppose one could consider the very existence of this module to be a
bug. Also, I have never been quite sure if that thing was a brussel
sprout or a cauliflower.

The input checking could probably be improved.

Make it easier to extend for use with other varieties of clocks. I am
considering having a more generic Acme::Time::Food, of which this would
be a subclass. Subclasses would just pass in a listref of foods. This
would make the module more useful to the sushi crowd, for example.

Some way to convert back to "real" time from vegetable notation.

=head1 SUPPORT

You're kidding, right? Stop being so silly!

=head1 AUTHOR

	Rich 'DrBacchus' Bowen
	CPAN ID: RBOW
	rich@DrBacchus.com
    http://www.DrBacchus.com/
	http://www.CooperMcGregor.com/

Kudos to Kate L Pugh for submitting a patch, and demonstrating that
there are other people in the world as silly as I am.

=head1 COPYRIGHT

Copyright (c) 2002 Rich Bowen. All rights reserved.
This program is free software; you can redistribute
it and/or modify it under the same terms as Perl itself.

The full text of the license can be found in the
LICENSE file included with this module.

=head1 veggietime

    print veggietime('5:17', 'en_GB');
    print veggietime('5:17'); # defaults to US English
    print veggietime; # defaults to current time and US English

Returns the veggie time equivalent of a 12-hour time expressed in the
format hh:mm. Will round to the nearest vegetable. Supports US and British
English.  With bad input returns undef and sets $Acme::Time::Asparagus::errstr

=cut

sub veggietime {
    my @args = @_;
    my ($time, $lang, $h, $m);

    if ($args[0]) {
        if ($args[0] =~ m/^\d{1,2}:\d{1,2}$/) {  # First arg is a time
            $time = $args[0];
            $lang = $args[1] if $args[1];
        } elsif (defined $times{$args[0]}) {  # First arg is a language
            $lang = $args[0];
        } else {  # First arg is in error
            $errstr = "Argument $args[0] is not recognised";
            return undef;
        }
    }

    if ($time) {
        ($h, $m) = split /:/, $time;
    } else {
        my @t = localtime;
        $h=$t[2];
        $m=$t[1];
    }

    # Default to US English for backwards compatibility.
    if (!$lang) {
        $lang = 'en_US';
    } elsif (!defined $times{$lang}) {
        $errstr = "Argument $lang is not a supported language";
        return undef;
    }
    my $times = $times{$lang};

    # o/~ We are the pirates who don't do anything o/~
    $h-=12 if $h>12;

    my $v = (int($m/5 + 0.5));

    if ($v == 0) {
        return $times->[$h - 1];
    } elsif ($v > 6) { # Won't you join me in my irritating little song?
        $h++;
        $h=1 if $h==13;
        return $times->[$v - 1] . ' before ' . $times->[$h - 1];
    } else { # It would be an honor!
        return $times->[$v - 1] . ' past ' . $times->[$h - 1];
    }
}

"Look. It's a cebu!";

