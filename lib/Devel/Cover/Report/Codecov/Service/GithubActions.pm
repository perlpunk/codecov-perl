package Devel::Cover::Report::Codecov::Service::GithubActions;
use strict;
use warnings;
use utf8;

sub detect {
    return $ENV{GITHUB_ACTIONS};
}

sub configuration {
    my $branch = $ENV{GITHUB_REF};
    $branch =~ s{^refs/heads/}{};
    return {
        service      => 'github-actions',
        commit       => $ENV{GITHUB_SHA},
#        build        => $ENV{GITHUB_RUN_NUMBER},
        build        => $ENV{GITHUB_RUN_ID},
        branch       => $branch,
        job          => $ENV{GITHUB_RUN_ID},
        pull_request => 'false', # TODO
        slug         => $ENV{GITHUB_REPOSITORY},
        tag          => '', #TODO $ENV{GITHUB_REF},
    };
}

1;
__END__
