{
  pkgs,
  stateVersion,
  username,
  ...
}: {
  imports = [
    ../../home-manager/common.nix
    ../../home-manager/modules/MacOS/aerospace.nix
    ../../home-manager/modules/cloud-tooling.nix
    ../../home-manager/modules/core-tooling.nix
    ../../home-manager/modules/extra.nix
    ../../home-manager/modules/ide.nix
  ];

  home.username = username;
  home.homeDirectory = "/Users/${username}";

  home.packages = with pkgs; [
    spotify
    aerospace
  ];

  nixpkgs.config.allowUnfreePredicate = pkg:
    builtins.elem (pkgs.lib.getName pkg) [
      "confluent-cli"
      "goland"
      "idea-community"
      "spotify"
      "vault"
    ];

  home.file = {
  };

  home.stateVersion = stateVersion;
}
