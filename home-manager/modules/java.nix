{pkgs, ...}: let
  javaDebug = import ../../pkgs/java-debug/derivation.nix {inherit pkgs;};
in {
  programs.java = {
    enable = true;
    package = pkgs.javaPackages.compiler.temurin-bin.jdk-25;
  };

  home.packages = with pkgs; [
    google-java-format
    gradle_9
    jdt-language-server
    maven
    visualvm
  ];

  xdg.configFile = {
    "nvim/ftplugin/java/lombok.jar".source = "${pkgs.lombok}/share/java/lombok.jar";
    "nvim/ftplugin/java/com.microsoft.java.debug.plugin-${javaDebug.pluginVersion}.jar".source =
      "${javaDebug}/share/java/com.microsoft.java.debug.plugin-${javaDebug.pluginVersion}.jar";
  };
}
