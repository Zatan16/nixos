{ pkgs, ... }:

{
  fonts.packages = with pkgs; [
    cozette
  ];

  fonts.fontconfig = {
    enable = true;
    allowBitmaps = true;
  };
}