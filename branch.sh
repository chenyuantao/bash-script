#!/bin/bash

# Pull the main branch and checkout new branch
#
# https://gist.github.com/tmiller/5222478
# https://stackoverflow.com/questions/402377/using-getopts-to-process-long-and-short-command-line-options

current_branch() {
  git symbolic-ref --short HEAD
}

saved_branch=$(current_branch)
main_branch=$1
new_branch=$2

if [ "${new_branch}" = "" ]; then
    new_branch=$main_branch
    main_branch=$saved_branch
fi

if [ "${main_branch}" = "${new_branch}" ]; then
    echo "fatal: new branch name" >&2
    exit 2
fi

git checkout "${main_branch}"
git pull

git checkout -b "${new_branch}"

echo "branch ${new_branch} done"
