#!/usr/bin/env sh

# Find IDEA
# TODO: Support non toolbox-install
IDEA=$(find ~/Library/Application\ Support/JetBrains/Toolbox/apps -type d -iname "*idea*.app" | sort | tail -n1)

# No arguments provided
if [ $# -eq 0 ]; then
  # Pull up the fuzzy finder
  PROJECT=$(ghq list --unique | fzf)
  PROJECT_DIR=$(ghq list -p -e $PROJECT)

  # Open IDEA on this project
  open -a "$IDEA" "$PROJECT_DIR"
  exit 0
fi

# File given
if [ -f "$1" ]; then
  # Open IDEA on that file
  # This will add it to the active IDEA workspace
  open -a "$IDEA" "$1"
  exit 0
fi

# Directory given
if [ -d "$1" ]; then
  # Open IDEA on that directory
  open -a "$IDEA" "$1"
  exit 0
fi

echo "error: not sure what to do with: $1"
