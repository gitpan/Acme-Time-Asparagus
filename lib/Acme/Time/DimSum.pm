package Acme::Time::DimSum;
use strict;

BEGIN {
    use Exporter();
    use vars qw ($VERSION @ISA @EXPORT @EXPORT $times );
    use Acme::Time::FooClock;
    $VERSION   = qw($Revision: 1.10 $)[1];
    @ISA       = qw (Exporter);
    @EXPORT = qw ( sushitime );

    $times = [
        'Potsticker',          'Perl Ball',
        'Custard Tart',        'Crab Craw',
        'Stuffed Bell Pepper', 'Spring Roll',
        'Shrimp Dumpling',     'Fried Won Ton',
        'Sui Mai',             'Fortune Cookie',
        'Fried Taro',          'Pork Bun'
    ];
}

# sub sushitime {{{

sub sushitime {
    return Acme::Time::FooClock::time(shift);
}    # }}}

1;

