#!/usr/bin/env sh
set -e

for pkg in $(find pkg -type d -maxdepth 1 -mindepth 1)
do
    (
        cd ./$pkg
        git pull origin master
    )
done
