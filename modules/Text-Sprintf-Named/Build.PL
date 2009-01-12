use strict;
use warnings;
use Module::Build;

my $builder = Module::Build->new(
    module_name         => 'Text::Sprintf::Named',
    license             => 'mit',
    dist_author         => 'Shlomi Fish <shlomif@cpan.org>',
    dist_version_from   => 'lib/Text/Sprintf/Named.pm',
    build_requires => {
        'Test::More' => 0,
        'Test::Warn' => 0,
    },
    add_to_cleanup      => [ 'Text::Sprintf::Named-*' ],
    create_makefile_pl => 'passthrough',
);

$builder->create_build_script();
