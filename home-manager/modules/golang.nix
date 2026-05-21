{pkgs, ...}: {
  home.packages = with pkgs; [
    delve
    gnumake
    go
    go-tools
    gofumpt
    pkgs.unstable.golangci-lint
    golangci-lint-langserver
    gopls
    gotools
  ];
}
