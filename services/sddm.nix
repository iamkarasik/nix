{
  pkgs,
  username,
  ...
}: {
  services.displayManager = {
    autoLogin = {
      enable = true;
      user = username;
    };
    sddm = {
      enable = true;
      autoNumlock = true;
      wayland = {
        enable = true;
        compositor = "kwin";
      };
      theme = "catppuccin-mocha-mauve";
      package = pkgs.kdePackages.sddm;
    };
  };
}
