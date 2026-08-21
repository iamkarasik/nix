{
  lib,
  pkgs,
  config,
  ...
}: let
  apps = config.iamkarasik.apps;
in {
  home.packages = lib.optional apps.google-chrome.enable pkgs.unstable.google-chrome;
}
