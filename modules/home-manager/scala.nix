{pkgs, ...}: {
  home.packages = with pkgs; [
    coursier
    metals
    sbt
    scala_3
    scalafmt
  ];
}
