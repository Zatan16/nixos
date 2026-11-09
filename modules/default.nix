{ ... }:

{
  imports = [
    ./core/applications.nix
    ./core/essentials.nix
    ./core/file-manager.nix
    ./core/nix-cleanup.nix
    ./core/silent-boot.nix
    ./core/waydroid.nix
    ./core/power-management.nix
    ./core/phone-connect.nix
    # ./core/virtualisation.nix
    # ./core/android-sdk.nix

    ./desktop/niri.nix
    ./desktop/fonts.nix

    ./hardware/nvidia.nix

    ./services/flatpak.nix
    ./services/gnome-keyring.nix
    # ./services/ollama.nix
    ./services/opencode.nix
    ./services/python.nix

    ./services/custom/noctalia.nix

    ./other/kitty.nix
    ./other/dolphin.nix
    # ./other/starship.nix

  ];
}