{pkgs, ...}: {
  home.packages = with pkgs; [
    jetbrains.idea-oss
    zed-editor
  ];
}
