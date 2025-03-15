{ pkgs, ... }:

{
  programs.neovim = import ../../pkgs/nvim/stable/nvim.nix pkgs;

  home.sessionVariables = {
    EDITOR = "nvim";
  };
}
