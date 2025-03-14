{ pkgs, ... }:

{
  programs.neovim = import ../../pkgs/nvim/unstable/nvim.nix pkgs;

  home.sessionVariables = {
    EDITOR = "nvim";
  };
}
