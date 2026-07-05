{ pkgs, ... }:

{
  home.packages = with pkgs; [
    python313
    python313Packages.pip
    nodejs
    gcc

    libinput  # Handles input

    smile  # GNOME Emoji Picker

    evince   # GNOME PDF Viewer

    kdePackages.kdeconnect-kde

    nvtopPackages.intel  # gpu details viewer
    htop  # system processes viewer
  ];
}