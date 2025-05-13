{ pkgs, ... }:

{
  programs.neovim = import ../../pkgs/nvim/current/nvim.nix pkgs;

  home.sessionVariables = {
    EDITOR = "nvim";
  };
}
