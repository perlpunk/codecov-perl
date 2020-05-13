package Devel::Cover::Report::Codecov::Service::GithubActions;
use strict;
use warnings;
use utf8;

sub detect {
    return $ENV{GITHUB_ACTIONS};
}

sub configuration {
    return {
        service      => 'github-actions',
        commit       => $ENV{GITHUB_SHA},
        build        => $ENV{GITHUB_RUN_NUMBER},
        branch       => $ENV{GITHUB_REF},
        job          => $ENV{GITHUB_RUN_ID},
#        pull_request => $ENV{},
        slug         => $ENV{GITHUB_REPOSITORY},
        tag          => $ENV{GITHUB_REF},
    };
}

1;
__END__
