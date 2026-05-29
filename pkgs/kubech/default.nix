{
  stdenvNoCC,
  fetchFromGitHub,
}:
stdenvNoCC.mkDerivation {
  pname = "kubech";
  version = "0-unstable-2025-04-23";

  src = fetchFromGitHub {
    owner = "DevOpsHiveHQ";
    repo = "kubech";
    rev = "b323cf1d176016e1581c181abce98fd78c561464";
    sha256 = "0zgh7ldy55rc572hhm94zi96yraahmykmd7i0n32zd2bacpkz32m";
  };

  dontConfigure = true;
  dontBuild = true;

  installPhase = ''
    runHook preInstall

    install -Dm644 kubech  $out/share/kubech/kubech

    install -Dm755 kubechc $out/bin/kubechc
    install -Dm755 kubechn $out/bin/kubechn

    substituteInPlace $out/bin/kubechc $out/bin/kubechn \
      --replace 'source ./kubech' "source $out/share/kubech/kubech"

    install -Dm644 completion/kubechc.zsh $out/share/zsh/site-functions/_kubechc
    install -Dm644 completion/kubechn.zsh $out/share/zsh/site-functions/_kubechn
    install -Dm644 completion/kubech.bash $out/share/bash-completion/completions/kubech

    runHook postInstall
  '';
}
