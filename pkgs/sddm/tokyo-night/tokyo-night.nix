{ pkgs }:

let
  config = ./theme.conf;
  image = ../../../dotfiles/wallpaper/blurred/current;
in
pkgs.stdenv.mkDerivation {
  name = "sddm-tokyo-night";

  src = pkgs.fetchFromGitHub {
    owner = "rototrash";
    repo = "tokyo-night-sddm";
    rev = "320c8e74ade1e94f640708eee0b9a75a395697c6";
    sha256 = "1gf074ypgc4r8pgljd8lydy0l5fajrl2pi2avn5ivacz4z7ma595";
  };

  dontWrapQtApps = true;

  buildInputs = with pkgs.libsForQt5.qt5; [ 
    qtquickcontrols2
    qtgraphicaleffects 
    qtsvg
  ];
  
  installPhase = ''
    mkdir -p $out
    cp -R ./* $out/
    cd $out/
    ls -al
    cp -r ${image} $out/Background.jpg
    cp -r ${config} $out/theme.conf
  '';
}

