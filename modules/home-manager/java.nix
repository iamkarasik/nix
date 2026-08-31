{
  pkgs,
  lib,
  ...
}: let
  jd = pkgs.iamkarasik.java-debug;
  junit-console = pkgs.fetchurl {
    url = "https://repo1.maven.org/maven2/org/junit/platform/junit-platform-console-standalone/6.1.3/junit-platform-console-standalone-6.1.3.jar";
    sha256 = "sha256-5iuWrEddvN6FmeqQXQiPZdkHePhuJZuFakn6XE6iVuw=";
  };
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
    "nvim/ftplugin/java/java-debug.jar".source = "${jd}/share/java/com.microsoft.java.debug.plugin-${jd.pluginVersion}.jar";
    "nvim/ftplugin/java/junit-console.jar".source = "${junit-console}";
  };
}
