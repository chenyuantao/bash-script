#!/bin/bash

# Commit and make a suffix message

current_branch() {
  git symbolic-ref --short HEAD
}

saved_branch=$(current_branch)
storyid="${saved_branch##*_}"
re='^[0-9]+$'

# if storyid is not a number , then set to 0
if ! [[ $storyid =~ $re ]] ; then
   storyid="0"
fi

git commit -m "$1" -m "--story=${storyid}" $2

echo "commit ${saved_branch} with storyid:${storyid} done"
