{ pkgs, ... }:

{
  home.packages = with pkgs; [
    gh
    vault
    gemini-cli
  ];
}
