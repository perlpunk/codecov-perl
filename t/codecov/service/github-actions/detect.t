use strict;
use warnings FATAL => 'all';
use utf8;

use lib '.';
use t::Util;
use Devel::Cover::Report::Codecov::Service::GithubActions;

sub travis { 'Devel::Cover::Report::Codecov::Service::GithubActions' }

subtest 'if travis' => sub {
    local $ENV{GITHUB_ACTIONS} = 1;
    ok( travis->detect );
};

subtest 'if not travis' => sub {
    local $ENV{GITHUB_ACTIONS} = 0;
    ok( not travis->detect );
};

done_testing;
