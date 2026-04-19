{pkgs, ...}: {
  home.packages = with pkgs; [
    gnumake
    go
    go-tools
    gopls
    gotools
  ];
}
