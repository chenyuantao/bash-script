#!/bin/bash

# Commit and make a suffix message

re='^[0-9]+$'
fixkeyword='fix:'
suffix='story'

current_branch() {
  git symbolic-ref --short HEAD
}

saved_branch=$(current_branch)
tapdid="${saved_branch##*_}"

# if tapdid is not a number , then set to 0
if ! [[ $tapdid =~ $re ]] ; then
    tapdid="0"
fi

# if msg has fix keyword , then change to bug
if [[ $1 =~ $fixkeyword]] ; then
    suffix="bug"
fi

git commit -m "$1" -m "--${suffix}=${tapdid}" $2

echo "commit ${saved_branch} with ${suffix} ${tapdid} done"
