use strict;
use warnings FATAL => 'all';
use 5.008001;
use ExtUtils::MakeMaker;
(do 'maint/Makefile.PL.include' or die $@) unless -f 'META.yml';

WriteMakefile(
  NAME => 'Safe::Isa',
  VERSION_FROM => 'lib/Safe/Isa.pm',

  META_MERGE => {
    dynamic_config => 0,

    resources => {
      # r/w: p5sagit@git.shadowcat.co.uk:Safe-Isa.git
      repository => 'git://git.shadowcat.co.uk/p5sagit/Safe-Isa.git',
      homepage => 'http://git.shadowcat.co.uk/gitweb/gitweb.cgi?p=p5sagit/Safe-Isa.git',
    },

    PREREQ_PM => {
      'Exporter' => 0,
      'Scalar::Util' => 0,
    },
  },
);
