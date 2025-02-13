{ pkgs, lib, ... }:

{
  home.packages = with pkgs; [
    confluent-cli
    volta
    postgresql_17
  ];

  nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
    "confluent-cli"
  ];
}
