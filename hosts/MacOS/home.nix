{
  pkgs,
  stateVersion,
  username,
  ...
}: {
  imports = [
    ../../home-manager/common.nix
    ../../home-manager/modules/MacOS/aerospace.nix
  ];

  home.username = username;
  home.homeDirectory = "/Users/${username}";

  home.packages = with pkgs; [
    spotify
    aerospace
  ];

  home.file = {
    ".aliases-jira.sh".source = ../../dotfiles/aliases/aliases-jira.sh;
  };

  home.stateVersion = stateVersion;
}
