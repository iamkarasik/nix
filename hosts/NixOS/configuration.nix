{
  pkgs,
  username,
  stateVersion,
  ...
}: let
  wallpaper = "DarkForestLights.png";
in {
  imports = [
    # Include the results of the hardware scan.
    ./nvidia.nix
    ./hardware-configuration.nix
  ];

  # Bootloader.
  boot.loader = {
    efi = {
      canTouchEfiVariables = true;
    };
    grub = {
      enable = true;
      device = "nodev";
      efiSupport = true;
      useOSProber = true;
      configurationLimit = 10;
      theme = "${pkgs.catppuccin-grub}";
    };
  };

  networking = {
    hostName = "nixos";
    networkmanager.enable = true;
    extraHosts = ''
      10.88.111.4 server
    '';
  };

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
      theme = "${import ../../pkgs/sddm/chili/chili.nix {
        inherit pkgs;
        inherit wallpaper;
      }}";
    };
  };

  # Enable sound with pipewire.
  services.pulseaudio.enable = false;
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
    extraGroups = ["networkmanager" "wheel"];
    packages = with pkgs; [
    ];
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  environment.sessionVariables = {
    XDG_CACHE_HOME = "$HOME/.cache";
    XDG_CONFIG_HOME = "$HOME/.config";
    XDG_DATA_HOME = "$HOME/.local/share";
    XDG_STATE_HOME = "$HOME/.local/state";
  };

  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
    nerd-fonts.zed-mono
    nerd-fonts.space-mono
  ];

  environment.systemPackages = with pkgs; [
    file # File command
    firefox
    git
    hypridle
    kitty
    libnotify
    lm_sensors
    networkmanagerapplet
    pulseaudio
    rofi-wayland
    swaybg
    swaylock-effects
    vim
    waybar
    waybar-mpris # Waybar utility to toggle audio
    wl-clipboard
    xfce.thunar
    gnome-calculator

    # Wayland screenshot
    slurp
    grim

    # Start SDDM using QT5+
    libsForQt5.qt5.qtquickcontrols2
    libsForQt5.qt5.qtgraphicaleffects
    libsForQt5.qt5.qtsvg
    # End SDDM

    # Containers
    dive
    podman-tui
    podman-compose
  ];

  virtualisation = {
    containers.enable = true;
    podman = {
      enable = true;
      dockerCompat = true;
      defaultNetwork.settings.dns_enabled = true;
    };
  };

  system.stateVersion = "${stateVersion}";
}
