{pkgs, ...}: {
  home.packages = with pkgs; [
    bun
    prettierd
    typescript-language-server
  ];
}
