#!/usr/bin/env bash
set -euo pipefail

if [[ "$(uname)" == "Darwin" ]]; then
    sys=$(nix build .#darwinConfigurations.MacOS.system --no-link --print-out-paths)
    sudo -H nix-env -p /nix/var/nix/profiles/system --set "$sys"
    sudo "$sys/sw/bin/darwin-rebuild" activate
else
    sudo nixos-rebuild switch --flake .#NixOS
fi
