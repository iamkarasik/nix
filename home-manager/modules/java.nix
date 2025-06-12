{ pkgs, ... }:

{
  home.packages = with pkgs; [
    gradle
    jdk21
    maven
    visualvm
  ];

  home.file = {
    ".config/nvim/ftplugin/java/lombok.jar".source = "${pkgs.lombok}/share/java/lombok.jar";
    ".config/nvim/ftplugin/java/com.microsoft.java.debug.plugin-0.53.1.jar".source = ../../files/jars/com.microsoft.java.debug.plugin-0.53.1.jar;
  };
}
