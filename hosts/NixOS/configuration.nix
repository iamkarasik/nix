{
  pkgs,
  username,
  ...
}: {
  imports = [
    ./nvidia.nix
    ./hardware-configuration.nix

    # Services
    ../../services/audio.nix
    ../../services/openssh.nix
    ../../services/dnsmasq.nix
    ../../services/sddm.nix
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
      # theme = "${pkgs.catppuccin-grub}";
    };
  };

  systemd.services = {
    privnet-route = {
      description = "Static route to privnet";
      after = ["NetworkManager-wait-online.service"];
      wants = ["NetworkManager-wait-online.service"];
      wantedBy = ["multi-user.target"];
      serviceConfig.Type = "oneshot";
      script = ''
        ${pkgs.iproute2}/bin/ip route replace 10.0.0.0/24 via 10.88.111.250
      '';
    };

    NetworkManager-wait-online.enable = true;
  };

  networking = {
    hostName = "nixos";
    networkmanager.enable = true;

    # /etc/hosts
    extraHosts = ''
    '';

    firewall.allowedTCPPorts = [12345];
    firewall.allowedUDPPorts = [12345];
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

  # RealtimeKit - PulseAudio uses this to acquire realtime priority
  security.rtkit.enable = true;

  # Without this hyprlock cannot authenticate and falls back to su.
  security.pam.services.hyprlock = {};

  programs.zsh.enable = true; # Required because shell defaults are in /etc/passwd

  users.users.${username} = {
    isNormalUser = true;
    shell = pkgs.zsh;
    description = "Goose";
    extraGroups = ["networkmanager" "wheel"];
  };

  fonts.fontconfig = {
    enable = true;

    hinting = {
      enable = true;
      style = "slight";
    };

    antialias = true;

    subpixel = {
      rgba = "rgb";
      lcdfilter = "default";
    };

    defaultFonts = {
      monospace = [(import ../../home-manager/modules/fonts/families.nix).mono];
      sansSerif = ["Noto Sans"];
      serif = ["Noto Serif"];
    };
  };

  environment.variables = {
    XCURSOR_THEME = "macOS";
    XCURSOR_SIZE = "24";
  };

  environment.systemPackages = with pkgs; [
    apple-cursor
    file # File command
    firefox
    pkgs.unstable.google-chrome
    git
    kitty
    libnotify
    lm_sensors
    networkmanagerapplet
    pulseaudio
    swaybg
    vim
    waybar-mpris # Waybar utility to toggle audio
    wl-clipboard
    xfce.thunar
    gnome-calculator

    deluge

    # Wayland screenshot
    slurp
    grim

    # Start SDDM using QT5+
    libsForQt5.qt5.qtquickcontrols2
    libsForQt5.qt5.qtgraphicaleffects
    libsForQt5.qt5.qtsvg
    (
      pkgs.catppuccin-sddm.override {
        flavor = "mocha";
        accent = "mauve";
        font = "Noto Sans";
        fontSize = "9";
        # background = "${./wallpaper.png}";
        loginBackground = true;
      }
    )
    # End SDDM

    # Containers
    dive
    podman-tui
    podman-compose
  ];

  xdg.mime.defaultApplications = {
    "text/html" = "google-chrome.desktop";
    "x-scheme-handler/http" = "google-chrome.desktop";
    "x-scheme-handler/https" = "google-chrome.desktop";
    "x-scheme-handler/about" = "google-chrome.desktop";
    "x-scheme-handler/unknown" = "google-chrome.desktop";
  };

  virtualisation = {
    containers.enable = true;
    podman = {
      enable = true;
      dockerCompat = true;
      defaultNetwork.settings.dns_enabled = true;
    };
  };

  system.stateVersion = "25.11";
}
