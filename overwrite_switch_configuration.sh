#!/usr/bin/env bash
sudo cp ~/nixos/configuration.nix /etc/nixos/configuration.nix
read -p "- - - ADD USER !!! IMPORTANT !!! - - - CAREFUL: Did you set the password for the user ? Press CTRL+C and do this now otherwise press enter to nixos-rebuild switch"
sudo nixos-rebuild switch