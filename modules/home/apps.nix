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
    zoom-us

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
    git-lfs  # git for latge files
    busybox  # provides lsusb and other unix utilities
  ];
}