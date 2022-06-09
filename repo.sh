#!/bin/bash

# Merges the target branch into current branch

url=$(git remote -v | grep -P ':(.*)\.git' -o -m 1)
echo "https://git.woa.com/${url: 1: 0-4}"