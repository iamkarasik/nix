{pkgs}:
pkgs.stdenv.mkDerivation rec {
  name = "java-debug-plugin";
  version = "0.59.0";
  pluginVersion = "0.53.2";

  src = pkgs.fetchurl {
    url = "https://open-vsx.org/api/vscjava/vscode-java-debug/${version}/file/vscjava.vscode-java-debug-${version}.vsix";
    sha256 = "120mzgd9i6533dgijg5g4anss26b8gq6a0ncvqvi3c5mvcj7wql7";
  };

  nativeBuildInputs = [pkgs.unzip];

  unpackPhase = ''
    unzip $src "extension/server/com.microsoft.java.debug.plugin-${pluginVersion}.jar"
  '';

  installPhase = ''
    mkdir -p $out/share/java
    cp extension/server/com.microsoft.java.debug.plugin-${pluginVersion}.jar \
       $out/share/java/
  '';
}
