# /hosts/nixos/home.nix
{ pkgs, stateVersion, username, ... }:

{
  # Enable Home Manager for the user
  home.username = username;  # Replace with your actual username
  home.homeDirectory = "/home/${username}";  # Replace with your actual home directory if needed

  # Enable Zsh shell
  programs.zsh.enable = true;
  
  # Enable Git
  programs.git.enable = true;
  
  # Enable system-wide packages through Home Manager
  home.packages = with pkgs; [
    neovim
    htop
    curl
    wget
    neofetch
  ];

  home.enableNixpkgsReleaseCheck = false;
  home.stateVersion = stateVersion;
}
