use strict;
use warnings FATAL => 'all';
use utf8;

use lib '.';
use t::Util;
use Devel::Cover::Report::Codecov::Service::GithubActions;

subtest basic => sub {
    local $ENV{GITHUB_SHA}        = 'commit';
    local $ENV{GITHUB_RUN_NUMBER} = 'job_number';
    local $ENV{GITHUB_REF}        = 'branch';
    local $ENV{GITHUB_RUN_ID}     = 'job_id';
    local $ENV{GITHUB_REPOSITORY} = 'repo_slug';
    #local $ENV{}                  = 'pull_request';

    my $configuration = Devel::Cover::Report::Codecov::Service::GithubActions->configuration;
    cmp_deeply
        $configuration,
        {
            service      => 'github-actions',
            commit       => 'commit',
            build        => 'job_number',
            branch       => 'branch',
            job          => 'job_id',
            pull_request => 'false',
            slug         => 'repo_slug',
            tag          => '',
        };
};

done_testing;
