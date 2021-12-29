#!/bin/bash

# Auto set upstream and pull branch

current_branch() {
  git symbolic-ref --short HEAD
}

saved_branch=$(current_branch)

git branch --set-upstream-to=origin/"${saved_branch}" "${saved_branch}"
git pull
