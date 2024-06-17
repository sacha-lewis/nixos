#!/usr/bin/env bash

# Check if an argument is provided
if [ -z "$1" ]; then
  echo "Error: No commit message provided."
  echo "Usage: $0 'commit message'"
  exit 1
fi

# copy the new changes
sudo cp /etc/nixos/configuration.nix ~/nixos/configuration.nix

# accept all files
git add *

git commit -m "$1"

git push origin master

#### new