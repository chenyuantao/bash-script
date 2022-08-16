#!/bin/bash

# Merges the target branch into current branch

get_current_branch() {
  git symbolic-ref --short HEAD
}

current_branch=$(get_current_branch)
target_branch=$1

if [ "${current_branch}" = "" ]; then
    echo "fatal: current dictionary is not a git repository" >&2
    exit 2
fi

if [ "${target_branch}" = "" ]; then
    echo "fatal: merge branch name can not be empty" >&2
    exit 2
fi

if [ "${target_branch}" = "${current_branch}" ]; then
    echo "fatal: merge branch name can not be same as current branch name"
    exit 2
fi

git checkout "${target_branch}"
git pull

git merge "${current_branch}"
git push

git checkout "${current_branch}"

echo "merge request ${target_branch} done"
