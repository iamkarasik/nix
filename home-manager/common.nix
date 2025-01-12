{ pkgs, ... }:

let
  customFonts = pkgs.nerdfonts.override {
   fonts = [ "JetBrainsMono" "ZedMono" ]; 
  };
in
{
  home.sessionVariables = {
    EDITOR = "nvim";
  };

  home.packages = with pkgs; [
    customFonts
    ripgrep
    fzf
  ];
}
