{ pkgs, inputs, ... }:

{
  imports = [ ./vscode.nix ./gnome-keyring.nix ./file-manager.nix ./flatpak.nix ];

  environment.systemPackages = with pkgs; [
    #  vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    #  wget
    alacritty
    vivaldi
    vivaldi-ffmpeg-codecs
    gedit
    git
    vesktop # Discord
    gpu-screen-recorder
    gnome-system-monitor # Process Monitor
    kdePackages.plasma-systemmonitor
    evince # PDF Viewer
    kitty

    inputs.torlink.packages.${system}.default
  ];
}