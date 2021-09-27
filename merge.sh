#!/bin/bash

# Merges the target branch into current branch
#
# https://gist.github.com/tmiller/5222478
# https://stackoverflow.com/questions/402377/using-getopts-to-process-long-and-short-command-line-options

current_branch() {
  git symbolic-ref --short HEAD
}

saved_branch=$(current_branch)
merge_branch=$1

if [ "${saved_branch}" = "" ]; then
    echo "fatal: current dictionary is not a git repository" >&2
    exit 2
fi

if [ "${merge_branch}" = "" ]; then
    echo "fatal: merge branch name can not be empty" >&2
    exit 2
fi

if [ "${merge_branch}" = "${saved_branch}" ]; then
    echo "fatal: merge branch name can not be same as current branch name"
    exit 2
fi

git checkout "${merge_branch}"
git pull

git checkout "${saved_branch}"
git merge "${merge_branch}"

echo "merge ${merge_branch} done"
