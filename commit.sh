#!/bin/bash

# Commit and make a suffix message

current_branch() {
  git symbolic-ref --short HEAD
}

saved_branch=$(current_branch)

git add .
git commit -m "$1" -m "--story=0" --no-verify

echo "commit ${saved_branch} done"
