{
  pkgs,
  system,
  username,
  ...
}: {
  programs = {
    zsh.enable = true;
  };

  environment.systemPackages = [
    pkgs.emacs
  ];

  # The platform the configuration will be used on.
  nixpkgs.hostPlatform = system;
  nixpkgs.config.allowUnfree = true;

  system.primaryUser = username;

  users.users.${username} = {
    home = "/Users/${username}";
  };

  system.defaults = {
    dock = {
      autohide = true;
      orientation = "left";
      show-process-indicators = false;
      show-recents = false;
      static-only = true;
      launchanim = true;
      mru-spaces = false;
      tilesize = 48;
    };

    finder = {
      AppleShowAllExtensions = true;
      ShowPathbar = true;
      FXPreferredViewStyle = "clmv";
    };

    menuExtraClock = {
      ShowSeconds = true;
      Show24Hour = true;
    };

    NSGlobalDomain = {
      AppleShowAllExtensions = true;

      ApplePressAndHoldEnabled = false;
      KeyRepeat = 1;
      InitialKeyRepeat = 15;
    };

    screencapture.location = "~/Pictures/ScreenShots";
  };

  homebrew = {
    enable = true;
  };

  # Used for backwards compatibility, please read the changelog before changing.
  # $ darwin-rebuild changelog
  system.stateVersion = 5;
}
