{inputs, ...}: {
  nixpkgs.config.allowUnfree = true;
  nixpkgs.overlays = [
    (import ../../overlays/unstable.nix {inherit (inputs) unstable;})
    (import ../../overlays/iamkarasik.nix)
  ];
}
