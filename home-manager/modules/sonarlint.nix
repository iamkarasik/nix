{ pkgs, ... }:

let
  customSonarLint = import ../../pkgs/sonarlint-language-server/derivation.nix { inherit pkgs; };
in
{
  home.packages = with pkgs; [
    customSonarLint
  ];
}
