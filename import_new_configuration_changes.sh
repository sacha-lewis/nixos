#!/usr/bin/env bash
# copy the new changes
sudo cp /etc/nixos/configuration.nix ~/nixos/configuration.nix

# accept all files
git add *

git commit -m "importing new configuration.nix changes"

git push origin master

#### new