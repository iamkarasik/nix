{ pkgs, wallpaper }:

let
  image = ../../../dotfiles/wallpaper/blurred/${wallpaper};
in
pkgs.stdenv.mkDerivation rec {

  name = "sddm-chili-theme";

  dontWrapQtApps = true;

  buildInputs = with pkgs.libsForQt5.qt5; [ 
    qtgraphicaleffects 
  ];

  src = pkgs.fetchFromGitHub {
    owner = "MarianArlt";
    repo = "sddm-chili";
    rev = "6516d50176c3b34df29003726ef9708813d06271";
    sha256 = "036fxsa7m8ymmp3p40z671z163y6fcsa9a641lrxdrw225ssq5f3";
  };

  installPhase = ''
    mkdir -p $out
    cp -R ./* $out/
    cd $out/
    cp -rL ${image} $out/assets/background.jpg
  '';
}
