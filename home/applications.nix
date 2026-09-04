{ pkgs, inputs, ... }:

{
  imports = [ ./vscode.nix ];

  home.packages = with pkgs; [
    # alacritty
    vivaldi
    vivaldi-ffmpeg-codecs
    gedit
    vesktop # Discord
    gpu-screen-recorder
    gnome-system-monitor # Process Monitor
    kdePackages.plasma-systemmonitor
    evince # PDF Viewer

    inputs.torlink.packages.${system}.default
  ];
}