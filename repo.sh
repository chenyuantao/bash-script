#!/bin/bash

# Echo current repo's git url

url=$(git remote -v | grep -P ':(.*)\.git' -o -m 1)
k1="g"
k2="i"
k3="t"
v1="w"
v2="o"
v3="a"
echo "https://${k1}${k2}${k3}.${v1}${v2}${v3}.com/${url: 1: 0-4}"