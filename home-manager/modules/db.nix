{ pkgs, ... }:

{
  home.packages = with pkgs; [
    pgcli
    postgresql
    pgloader
  ];
}
