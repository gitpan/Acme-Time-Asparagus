use ExtUtils::MakeMaker;
# See lib/ExtUtils/MakeMaker.pm for details of how to influence
# the contents of the Makefile that is written.
WriteMakefile(
    NAME         => 'Acme::Time::Asparagus',
    VERSION_FROM => 'lib/Acme/Time/Asparagus.pm', # finds $VERSION
    AUTHOR       => 'Rich Bowen (rich@DrBacchus.com)',
    ABSTRACT     => 'Time on the vegetable clock',
    PREREQ_PM    => {
        'Test::More' => 0,
    },
);
