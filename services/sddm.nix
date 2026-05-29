{
  pkgs,
  username,
  ...
}: {
  services.displayManager = {
    autoLogin.user = username;
    sddm = {
      enable = true;
      autoNumlock = true;
      wayland.enable = true;
      theme = "catppuccin-mocha-mauve";
      package = pkgs.kdePackages.sddm;
    };
  };
}
