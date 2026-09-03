{
  pkgs,
  lib,
  config,
  ...
}: let
  cfg = config.iamkarasik.caffeinate;
in {
  options.iamkarasik.caffeinate.enable = lib.mkEnableOption "keep the Mac awake via a caffeinate LaunchAgent";

  config = lib.mkIf (cfg.enable && pkgs.stdenv.isDarwin) {
    launchd.agents.caffeinate = {
      enable = true;
      config = {
        ProgramArguments = ["/usr/bin/caffeinate" "-dims"];
        # Launch it the moment the agent loads (at login).
        RunAtLoad = true;
        # If caffeinate ever exits, launchd immediately respawns it.
        KeepAlive = true;
        # Timestamped output goes here; handy while learning/debugging.
        StandardOutPath = "${config.home.homeDirectory}/Library/Logs/caffeinate.log";
        StandardErrorPath = "${config.home.homeDirectory}/Library/Logs/caffeinate.log";
      };
    };
  };
}
