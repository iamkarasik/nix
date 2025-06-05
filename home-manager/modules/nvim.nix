{ pkgs, ... }:

{
  programs.neovim = import ../../pkgs/nvim/current/nvim.nix pkgs;

  home.sessionVariables = {
    EDITOR = "nvim";
  };

  home.file = {
    ".config/nvim/snippets".source = ../../pkgs/nvim/current/snippets;
  };
}
