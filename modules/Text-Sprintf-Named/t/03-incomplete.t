#!/usr/bin/perl

use strict;
use warnings;

use Test::More tests => 6;
use Test::Warn;
use Text::Sprintf::Named;

my $obj;

#Test 1
$obj = Text::Sprintf::Named->new( { fmt => 'No Tokens Here!', } );

warnings_are { $obj->format() }[], 'No Tokens and No Parameters';

#Test 2
$obj = Text::Sprintf::Named->new( { fmt => "Example >%(name)s<", } );

warning_like { $obj->format() } qr/Token 'name'/,
  'Missing Token Throws Warning ( String )';

#Test 3
$obj = Text::Sprintf::Named->new( { fmt => "Example >%(foo)8.3f<", } );

warnings_like { $obj->format() }[ qr/Token 'foo'/, qr/numeric.*sprintf/ ],
  'Missing Token Throws Warning ( Float )';

no warnings 'Text::Sprintf::Named';

#Test 4
$obj = Text::Sprintf::Named->new( { fmt => 'No Tokens Here!', } );

warnings_are { $obj->format() }[], 'No Tokens and No Parameters';

#Test 5
$obj = Text::Sprintf::Named->new( { fmt => "Example >%(name)s<", } );

warnings_are { $obj->format() }[],
  '[Silent] Missing Token Throws Warning ( String )';

#Test 6
$obj = Text::Sprintf::Named->new( { fmt => "Example >%(foo)8.3f<", } );

warnings_like { $obj->format() }[qr/numeric.*sprintf/],
  '[Subdued] Missing Token Throws Warning ( Float )';
