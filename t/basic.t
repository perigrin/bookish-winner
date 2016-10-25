#!/usr/bin/env perl
use 5.10.1;
use warnings;

use Test::More;
use Test::Deep;

use Bookish::Winner qw(tokens);

my @dict = qw(
  arrows
  carrots
  give
  me
);

ok my %output = tokens @dict;

my $sequences = [ sort keys %output ];

cmp_deeply $sequences, [
    qw(
      carr
      give
      rots
      rows
      rrot
      rrow
      )
];

cmp_deeply [ @output{@$sequences} ], [
    qw(
      carrots
      give
      carrots
      arrows
      carrots
      arrows
      )
];

done_testing;
