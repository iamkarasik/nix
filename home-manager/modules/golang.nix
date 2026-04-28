{pkgs, ...}: {
  home.packages = with pkgs; [
    delve
    gnumake
    go
    go-tools
    gofumpt
    gopls
    gotools
  ];
}
