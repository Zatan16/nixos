{ pkgs, ... }:

{
  fonts.packages = with pkgs; [
    cozette
  ];

  fonts.fontconfig.enable = true;
  fonts.fontconfig.allowBitmaps = true;
}