{pkgs, ...}: {
  home.packages = with pkgs; [
    cargo
    clippy
    rust-analyzer
    rustc
    rustfmt
  ];
}
