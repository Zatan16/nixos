{ pkgs, ... }:

{
  fonts.packages = with pkgs; [
    cozette
    noto-fonts
    nerd-fonts.noto
  ];

  fonts.fontconfig = {
    enable = true;
    allowBitmaps = true;
  };
}