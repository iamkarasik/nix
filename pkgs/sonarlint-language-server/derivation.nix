{ pkgs }:

pkgs.stdenv.mkDerivation rec {
  name = "sonarlint-language-server";
  version = "4.20.2";
  snapshot = "77498";

  src = pkgs.fetchurl {
    url = "https://github.com/SonarSource/sonarlint-vscode/releases/download/${version}+${snapshot}/sonarlint-vscode-${version}.vsix";
    sha256 = "0wsj09nwq8shp4fy7bk6kgmy6iw1pnx0n0c10pjiq48by8adhlbv";
  };

  nativeBuildInputs = [
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
    analyzers=$(find $out/analyzers -type f -name "*.jar" | xargs echo)

    makeWrapper ${pkgs.jre_headless}/bin/java $out/bin/sonarlint-ls \
      --add-flags "-jar $out/server/sonarlint-ls.jar" \
      --add-flags "-stdio" \
      --add-flags "-analyzers $analyzers"
  '';
}
