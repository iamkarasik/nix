{lib, ...}: let
  fonts = import ../../lib/fonts.nix;
in {
  options.iamkarasik = {
    fonts = {
      mono = lib.mkOption {
        type = lib.types.str;
        default = fonts.mono;
        description = "Monospace font family.";
      };
      sans = lib.mkOption {
        type = lib.types.str;
        default = fonts.sans;
        description = "Sans-serif font family.";
      };
    };

    git = {
      name = lib.mkOption {
        type = lib.types.str;
        default = "iamkarasik";
        description = "Default git user.name.";
      };
      email = lib.mkOption {
        type = lib.types.str;
        default = "ilankarasik@gmail.com";
        description = "Default git user.email.";
      };
    };

    wallpaper = lib.mkOption {
      type = lib.types.path;
      default = ../../dotfiles/wallpaper/Monterey.jpg;
    };

    theme = lib.mkOption {
      type = lib.types.attrs;
      default = import ../../lib/themes/vscode.nix;
    };

    apps = {
      google-chrome.enable = lib.mkOption {
        type = lib.types.bool;
        default = true;
        description = "Install Google Chrome.";
      };
    };
  };
}
