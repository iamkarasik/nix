{pkgs, ...}: {
  home.packages = with pkgs; [
    prettierd
    typescript-language-server
  ];
}
