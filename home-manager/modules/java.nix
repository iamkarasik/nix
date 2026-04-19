{pkgs, ...}: {
  programs.java = {
    enable = true;
    package = pkgs.javaPackages.compiler.temurin-bin.jdk-25;
  };

  home.packages = with pkgs; [
    gradle_9
    jdt-language-server
    maven
    visualvm
  ];

  home.file = {
    ".config/nvim/ftplugin/java/lombok.jar".source = "${pkgs.lombok}/share/java/lombok.jar";
    ".config/nvim/ftplugin/java/com.microsoft.java.debug.plugin-0.53.1.jar".source = ../../files/jars/com.microsoft.java.debug.plugin-0.53.1.jar;
  };
}
