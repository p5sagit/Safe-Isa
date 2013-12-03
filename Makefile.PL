use strict;
use warnings FATAL => 'all';
use 5.008001;
use ExtUtils::MakeMaker;
(do 'maint/Makefile.PL.include' or die $@) unless -f 'META.yml';

WriteMakefile(
  NAME => 'Safe::Isa',
  VERSION_FROM => 'lib/Safe/Isa.pm',

  MIN_PERL_VERSION => '5.006',

  PREREQ_PM => {
    'Exporter' => '5.57',
    'Scalar::Util' => 0,
  },

  -f 'META.yml' ? () : (
    META_MERGE => {
      'meta-spec' => { version => 2 },
      dynamic_config => 0,

      resources => {
        # r/w: p5sagit@git.shadowcat.co.uk:Safe-Isa.git
        repository => {
          url => 'git://git.shadowcat.co.uk/p5sagit/Safe-Isa.git',
          web => 'http://git.shadowcat.co.uk/gitweb/gitweb.cgi?p=p5sagit/Safe-Isa.git',
          type => 'git',
        },
        bugtracker => {
            mailto => 'bug-Safe-Isa@rt.cpan.org',
            web => 'https://rt.cpan.org/Public/Dist/Display.html?Name=Safe-Isa',
        },
      },
    },
  ),
);
