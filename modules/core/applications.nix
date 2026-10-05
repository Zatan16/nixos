{ pkgs, ... }:

{
  # imports = [ ./gnome-keyring.nix ./flatpak.nix ./file-manager.nix ];

  environment.systemPackages = with pkgs; [
    git
    alacritty
    vivaldi
    vivaldi-ffmpeg-codecs
    android-tools
    sshfs
    glib
    scrcpy
    baobab
  ];

  programs.steam.enable = true;
  programs.gpu-screen-recorder.enable = true;
  programs.kdeconnect.enable = true;
  programs.gnome-disks.enable = true;
}