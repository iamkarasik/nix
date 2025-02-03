{ pkgs, ... }:

{
  home.packages = [
    (pkgs.nerdfonts.override { fonts = [ "JetBrainsMono" "ZedMono" ]; })
  ];
}
