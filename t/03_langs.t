use Test::More qw(no_plan);

BEGIN {
    use_ok ('Acme::Time::Asparagus');
}

is( veggietime('7:45', 'en_US'), 'Corn before Onion');
is( veggietime('14:29', 'en_US'), 'Pumpkin past Eggplant');
is( veggietime('7:45', 'en_GB'), 'Sweetcorn before Onion');
is( veggietime('14:29', 'en_GB'), 'Pumpkin past Aubergine');

