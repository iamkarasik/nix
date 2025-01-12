# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ pkgs, username, stateVersion, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./nvidia.nix
      ./hardware-configuration.nix
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "America/Toronto";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_CA.UTF-8";

  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  # Enable CUPS to print documents.
  services.printing.enable = false;

  services.displayManager = {
    autoLogin.user = username;
    sddm = {
      enable = true; 
      autoNumlock = true; 
      wayland.enable = true;
      theme = "${import ../../pkgs/sddm/chili/chili.nix { inherit pkgs; }}";
    };
  };

  # Enable sound with pipewire.
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
  };

  programs.zsh.enable = true; # Required because shell defaults are in /etc/passwd
  users.users.${username} = {
    isNormalUser = true;
    shell = pkgs.zsh;
    description = "Goose";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
    ];
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    firefox
    git
    kitty
    libnotify
    lm_sensors
    (nerdfonts.override { fonts = [ "JetBrainsMono" "ZedMono" "Noto" ]; })
    networkmanagerapplet
    pulseaudio
    rofi-wayland
    swaybg
    swaylock-effects
    vim
    waybar
    wl-clipboard
    xfce.thunar

    # Start SDDM using QT5+
    libsForQt5.qt5.qtquickcontrols2
    libsForQt5.qt5.qtgraphicaleffects
    libsForQt5.qt5.qtsvg
    # End SDDM
  ];

  system.stateVersion = "${stateVersion}";
}
