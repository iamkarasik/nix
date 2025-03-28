{ pkgs, ... }:

{
  home.packages = with pkgs; [
    maven
    gradle
    jdk21
  ];
}
