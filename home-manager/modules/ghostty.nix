{
  lib,
  system,
  ...
}:
lib.mkIf (system != "aarch64-darwin") {
  programs.ghostty = import ../../pkgs/ghostty/ghostty.nix {inherit system;};
}
