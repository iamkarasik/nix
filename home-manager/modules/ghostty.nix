{
  lib,
  system,
  ...
}: {
  programs.ghostty = import ../../pkgs/ghostty/ghostty.nix {inherit system;};
}
