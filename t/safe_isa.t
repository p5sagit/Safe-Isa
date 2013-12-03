use strict;
use warnings FATAL => 'all';
use Test::More tests => 28;

{ package Foo; sub new { bless({}, $_[0]) } }
{ package Bar; our @ISA = qw(Foo); sub bar { 1 } }

my $foo = Foo->new;
my $bar = Bar->new;
my $blam = [ 42 ];
my $class = 'Bar';
my $blam2 = '';

# basic isa usage -

ok($foo->isa('Foo'), 'foo isa Foo');
ok($bar->isa('Foo'), 'bar isa Foo');
ok($class->isa('Foo'), 'class name isa Foo');
ok(!eval { $blam->isa('Foo'); 1 }, 'blam goes blam with isa');
ok(!eval { $blam2->isa('Foo'); 1 }, 'blam2 goes blam with isa');

ok(!$foo->can('bar'), 'foo !can bar');
ok($bar->can('bar'), 'bar can bar');
ok($class->can('bar'), 'our class name can bar');
ok(!eval { $blam->can('bar'); 1 }, 'blam goes blam with can');
ok(!eval { $blam2->can('bar'); 1 }, 'blam2 goes blam with can');

use Safe::Isa;

ok($foo->$_isa('Foo'), 'foo $_isa Foo');
ok($bar->$_isa('Foo'), 'bar $_isa Foo');
ok($class->$_isa('Foo'), 'class name $_isa Foo');
ok(eval { $blam->$_isa('Foo'); 1 }, 'no boom today with isa');
ok(eval { $blam2->$_isa('Foo'); 1 }, 'no boom today with isa');

ok(!$foo->$_can('bar'), 'foo !$_can bar');
ok($bar->$_can('bar'), 'bar $_can bar');
ok($class->$_can('bar'), 'class name $_can bar');
ok(eval { $blam->$_can('bar'); 1 }, 'no boom today with can');
ok(eval { $blam2->$_can('bar'); 1 }, 'no boom today with can');

ok($foo->$_call_if_object(isa => 'Foo'), 'foo $_call_if_object(isa => Foo)');
ok($bar->$_call_if_object(isa => 'Foo'), 'bar $_call_if_object(isa => Foo)');
ok(eval { $blam->$_call_if_object(isa => 'Foo'); 1 }, 'no boom today with _call_if_object');

ok($foo->$_call_if_object_or_classname(isa => 'Foo'), 'foo $_call_if_object_or_classname(isa => Foo)');
ok($bar->$_call_if_object_or_classname(isa => 'Foo'), 'bar $_call_if_object_or_classname(isa => Foo)');
ok($class->$_call_if_object_or_classname(isa => 'Foo'), 'class name $_call_if_object_or_classname(isa => Foo)');
ok(eval { $blam->$_call_if_object_or_classname(isa => 'Foo'); 1 }, 'no boom today with _call_if_object_or_classname');
ok(eval { $blam2->$_call_if_object_or_classname(isa => 'Foo'); 1 }, 'no boom today with _call_if_object_or_classname');
