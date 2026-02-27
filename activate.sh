if [[ "$(uname)" == "Darwin" ]]; then
    sudo darwin-rebuild switch --flake .#MacOS
else
    sudo nixos-rebuild switch --flake .#NixOS
fi
