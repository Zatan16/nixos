{ pkgs, ... }:

{
  home.packages = with pkgs; [
    # Terminal & Editors
    alacritty
    gedit

    # Browser
    vivaldi
    vivaldi-ffmpeg-codecs  # enables video playback in vivaldi

    # Communication
    vesktop  # discord client with wayland support

    # Music
    spotify

    # Game Development
    godot

    # Office & Documents
    libreoffice
    obsidian
    pdfstudio2024

    # Dev Tools
    git
    busybox  # provides lsusb and other unix utilities
  ];
}