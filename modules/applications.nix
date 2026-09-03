{ pkgs, ... }:

{
  imports = [ ./gnome-keyring.nix ./flatpak.nix ./file-manager.nix ];

  environment.systemPackages = with pkgs; [
    git
    alacritty
    vivaldi
    vivaldi-ffmpeg-codecs
  ];
}