{pkgs, ...}: let
  jd = pkgs.iamkarasik.java-debug;
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
    "nvim/ftplugin/java/com.microsoft.java.debug.plugin-${jd.pluginVersion}.jar".source = "${jd}/share/java/com.microsoft.java.debug.plugin-${jd.pluginVersion}.jar";
  };
}
