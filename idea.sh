#!/usr/bin/env sh

# Find the latest version of IDEA installed
IDEA=$(ls -1d ~/Library/Application\ Support/JetBrains/Toolbox/apps/IDEA-U/*/*/*.app | tail -n1)
WORK_DIR=$(pwd)

# Open IDEA
open -a "${IDEA}" ${@}
