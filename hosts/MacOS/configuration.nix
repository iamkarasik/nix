{
  pkgs,
  username,
  inputs,
  ...
}: {
  imports = [
    inputs.home-manager.darwinModules.home-manager
    ../../modules/profiles/maintenance.nix
  ];

  home-manager.useGlobalPkgs = true;
  home-manager.useUserPackages = true;
  home-manager.users.${username} = ./home.nix;
  home-manager.extraSpecialArgs = {inherit inputs username;};

  programs = {
    zsh.enable = true;
  };

  environment.systemPackages = [
    pkgs.emacs
  ];

  environment.variables.EDITOR = "nvim";

  environment.shellAliases = {
    jira-tickets = ''acli jira workitem search --jql "assignee = currentUser() AND resolution = Unresolved ORDER BY updated DESC" --fields "key,summary,status,priority"'';
    jira-recent = ''acli jira workitem search --jql "assignee = currentUser() AND updated >= -7d ORDER BY updated DESC" --fields "key,summary,status,priority"'';
    jira-view = "acli jira workitem view";
  };

  system.primaryUser = username;

  users.users.${username} = {
    home = "/Users/${username}";
  };

  system.defaults = {
    ".GlobalPreferences"."com.apple.mouse.scaling" = -1.0;

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

    taps = [];

    brews = [];

    casks = [
      "ghostty"
      "alfred"
    ];
  };

  # Used for backwards compatibility, please read the changelog before changing.
  # $ darwin-rebuild changelog
  system.stateVersion = 5;
}
