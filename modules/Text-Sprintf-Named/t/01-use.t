#!/usr/bin/perl

use strict;
use warnings;

use Test::More tests => 4;

use Text::Sprintf::Named;

# Instantiate an object.
{
    my $obj = Text::Sprintf::Named->new({fmt => "Hello %(name)s!"});

    # TEST
    ok ($obj, "Object was instantiated");
}

{
    my $obj = Text::Sprintf::Named->new({fmt => "95%% Humidity"});

    # TEST
    is ($obj->format(), "95% Humidity", "Checking ->format() - 1");
    # TEST
    is ($obj->format({args => {}}), "95% Humidity",
        "Checking ->format() - 2 - empty hashref"
    );
    # TEST
    is ($obj->format({args => {foo => "Bardom", "isaac" => "Newton"}}), 
        "95% Humidity",
        "Checking ->format() - 3 - full hashref"
    );
}

# TODO : test for:
# 1. Consecutive percent signs.
# 2. More than one double percent sign in a string.
