{ ... }:

{
  imports = [
    ./core/applications.nix
    ./core/essentials.nix
    ./core/file-manager.nix
    ./core/nix-cleanup.nix
    # ./core/virtualisation.nix
    ./core/stylix.nix
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
  ];
}