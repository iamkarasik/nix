{ pkgs, ... }:

{
  home.packages = with pkgs; [
    gnumake
    go
    gotools
    go-tools
  ];
}
