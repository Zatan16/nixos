{ pkgs, ... }:

{
  imports = [ ./vscode.nix ./gnome-keyring.nix ./file-manager.nix ];

  environment.systemPackages = with pkgs; [
    #  vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    #  wget
    alacritty
    vivaldi
    vivaldi-ffmpeg-codecs
    gedit
    git
    vesktop
    gpu-screen-recorder
    gnome-system-monitor
  ];
}