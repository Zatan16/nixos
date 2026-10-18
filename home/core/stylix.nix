{ pkgs, lib, ... }:

{
  stylix = {
    enable = true;

    icons = {
      enable = true;
      package = pkgs.papirus-icon-theme;
      dark = "Papirus-Dark";
      light = "Papirus-Light";
    };  

    targets = {
      kde.enable = false;
      qt.enable = true;
    };
  };

  qt = {
    enable = true;
    platformTheme.name = lib.mkForce "kde";
    style.name = "breeze";
  };
}