{
  lib,
  pkgs,
  osConfig,
  ...
}: let
  apps = osConfig.iamkarasik.apps;
in {
  home.packages = lib.optional apps.google-chrome.enable pkgs.unstable.google-chrome;
}
