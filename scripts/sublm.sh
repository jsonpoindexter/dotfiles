#!/usr/bin/env sh
set -e

SUBLM="/Applications/Sublime Merge.app"

# No arguments provided
if [ $# -eq 0 ]; then
  # Pull up the fuzzy finder
  PROJECT=$(ghq list --unique | fzf)
  PROJECT_DIR=$(ghq list -p -e $PROJECT)

  # Open IDEA on this project
  open -a "$SUBLM" "$PROJECT_DIR"
  exit 0
fi

# Directory given
if [ -d "$1" ]; then
  open -a "$SUBLM" "$1"
  exit 0
fi

# Use whatever else we have to filter the list of projects
# Pull up the fuzzy finder
PROJECT=$(ghq list --unique $1 | fzf)
PROJECT_DIR=$(ghq list -p -e $PROJECT)

if [ -d "$PROJECT_DIR" ]; then
  open -a "$SUBLM" "$PROJECT_DIR"
  exit 0
fi
