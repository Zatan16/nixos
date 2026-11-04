{ pkgs, ... }:

{
  environment.systemPackages = with pkgs.kdePackages; [
    dolphin
    kio-extras
    plasma-integration
    kio-fuse
  ];

  services.udisks2.enable = true;

  environment.etc."xdg/kdeglobals".text = ''
    [ColorScheme]
    Name=noctalia

    [Icons]
    Theme=Papirus-Dark
  '';
}