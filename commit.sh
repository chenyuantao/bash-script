#!/bin/bash

# Commit and make a suffix message

current_branch() {
  git symbolic-ref --short HEAD
}

saved_branch=$(current_branch)

git commit -m "$1" -m "--story=0" $2

echo "commit ${saved_branch} done"
