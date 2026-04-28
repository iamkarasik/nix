{...}: {
  programs.zen-browser = {
    enable = true;
    setAsDefaultBrowser = true;

    policies = {
      DisableAppUpdate = true;
      DisablePocket = true;
      DisableTelemetry = true;
    };

    profiles.default = {
      isDefault = true;
      settings = {
        "zen.workspaces.continue-where-left-off" = true;
        "zen.view.compact.hide-tabbar" = true;
        "zen.urlbar.behavior" = "float";
      };
    };
  };
}
