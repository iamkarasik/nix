{ pkgs, ... }:

{
  home.packages = with pkgs; [
    maven
    gradle
    jdk21
  ];

  home.file = {
    ".config/nvim/ftplugin/java/lombok.jar".source = "${pkgs.lombok}/share/java/lombok.jar";
  };
}
