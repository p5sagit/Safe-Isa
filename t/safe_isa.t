use strict;
use warnings FATAL => 'all';
use Test::More tests => 15;

{ package Foo; sub new { bless({}, $_[0]) } }
{ package Bar; our @ISA = qw(Foo); sub bar { 1 } }

my $foo = Foo->new;
my $bar = Bar->new;
my $blam = [ 42 ];

# basic isa usage -

ok($foo->isa('Foo'), 'foo isa Foo');
ok($bar->isa('Foo'), 'bar isa Foo');
ok(!eval { $blam->isa('Foo'); 1 }, 'blam goes blam');

ok(!$foo->can('bar'), 'foo !can bar');
ok($bar->can('bar'), 'bar can bar');
ok(!eval { $blam->can('bar'); 1 }, 'blam goes blam');

use Safe::Isa;

ok($foo->$_isa('Foo'), 'foo $_isa Foo');
ok($bar->$_isa('Foo'), 'bar $_isa Foo');
ok(eval { $blam->$_isa('Foo'); 1 }, 'no boom today');

ok(!$foo->$_can('bar'), 'foo !$_can bar');
ok($bar->$_can('bar'), 'bar $_can bar');
ok(eval { $blam->$_can('bar'); 1 }, 'no boom today');

ok($foo->$_call_if_object(isa => 'Foo'), 'foo $_call_if_object(isa => Foo)');
ok($bar->$_call_if_object(isa => 'Foo'), 'bar $_call_if_object(isa => Foo)');
ok(eval { $blam->$_call_if_object(isa => 'Foo'); 1 }, 'no boom today');
