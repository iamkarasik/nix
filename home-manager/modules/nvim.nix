{ pkgs, ... }:

{
  programs.neovim = import ../../pkgs/nvim/nvim.nix pkgs;

  home.sessionVariables = {
    EDITOR = "nvim";
  };
}
