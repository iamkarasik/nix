{ pkgs }:

pkgs.stdenv.mkDerivation rec {
  name = "sonarlint-language-server";
  version = "4.14.1";
  snapshot = "77101";

  src = pkgs.fetchurl {
    url = "https://github.com/SonarSource/sonarlint-vscode/releases/download/${version}+${snapshot}/sonarlint-vscode-${version}.vsix";
    sha256 = "15yy1sqdxmzcz4knj69bgy93z988vzp0891hr80p72y7907vgmma";
  };

  nativeBuildInputs = with pkgs; [
    pkgs.unzip
    pkgs.makeWrapper
  ];

  unpackPhase = ''
    mkdir -p $out/{analyzers,server}
    unzip $src "extension/analyzers/*" "extension/server/*"
  '';

  buildPhase = ''
    mv extension/analyzers/* $out/analyzers
    mv extension/server/sonarlint-ls.jar $out/server
  '';

  installPhase = ''
    analyzers=$(find $out/analyzers | xargs echo)

    makeWrapper ${pkgs.jre_headless}/bin/java $out/bin/sonarlint-ls \
      --add-flags "-jar $out/server/sonarlint-ls.jar" \
      --add-flags "-stdio" \
      --add-flags "-analyzers $analyzers"
  '';
}
