{ pkgs, username, ... }:

let
  customNeovim = import ./config/nvim/nvim.nix;
  customAlacritty = import ./config/alacritty/alacritty.nix;
  customLsd = import ./config/lsd/lsd.nix;
  customZsh = import ./config/zsh/zsh.nix;
  customTmux = import ./config/tmux/tmux.nix;

  customFonts = pkgs.nerdfonts.override {
   fonts = [ "JetBrainsMono" "ZedMono" ]; 
  };

  coreTooling = import ./modules/core-tooling.nix { inherit pkgs; };
  cloudTooling = import ./modules/cloud-tooling.nix { inherit pkgs; };
  ide = import ./modules/ide.nix { inherit pkgs; };
  confluentTooling = import ./modules/confluent.nix { inherit pkgs; };
  extraTooling = import ./modules/extra.nix { inherit pkgs; };

  personal = with pkgs; [
    customFonts
    fzf
    raycast
    ripgrep
    spotify
  ];
in
{
  nixpkgs.config.allowUnfree = true;

  # Home Manager needs a bit of information about you and the paths it should manage.
  home.username = username;
  home.homeDirectory = "/Users/${username}";

  programs = {
    neovim = customNeovim pkgs;
    alacritty = customAlacritty pkgs;
    lsd = customLsd pkgs;
    zsh = customZsh pkgs;
    tmux = customTmux pkgs;
  };

  home.packages = personal ++ coreTooling ++ cloudTooling ++ ide ++ confluentTooling ++ extraTooling;

  home.file = {
    ".config/zellij".source = ./dotfiles/zellij;
    # ".config/zsh".source = ./dotfiles/zsh;
    # ".config/zsh/.zshenv".source = ./dotfiles/zsh/.zshenv
  };

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "24.11";
}
