{ pkgs, ... }:

{
  home.packages = with pkgs; [
    cabal-install
    ghc
    haskell-language-server
    haskellPackages.cabal-fmt
    ormolu
    stack
  ];
}
