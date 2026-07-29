final: _: {
  iamkarasik = {
    java-debug = final.callPackage ../pkgs/java-debug/package.nix {};
    kubech = final.callPackage ../pkgs/kubech/package.nix {};
    sonarlint-language-server = final.callPackage ../pkgs/sonarlint-language-server/package.nix {};
  };
}
