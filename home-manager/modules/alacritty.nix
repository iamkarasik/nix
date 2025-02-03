{ system, ... }:

{
  programs.alacritty = import ../../pkgs/alacritty/alacritty.nix { inherit system; };
}
