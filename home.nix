{ lib, pkgs, ... }:

{
  home.stateVersion = "24.11";

  home.sessionVariables = {
    NIXOS_OZONE_WL = "1";  # Instructs Electron apps (like Discord) to use Wayland instead of X11
    XDG_DATA_DIRS = "$HOME/.nix-profile/share:/run/current-system/sw/share:$XDG_DATA_DIRS";  # Ensures Dolphin and other apps can find .desktop files at runtime
    GTK_THEME = "Numix";  # Forces theme for GTK apps that don't read dconf
  };

  imports = [
    ./modules/home/games.nix
    ./modules/home/learn-hacking.nix
    ./modules/home/utilities.nix
    ./modules/home/vscode.nix
    ./modules/home/apps.nix
    ./modules/home/file-explorers.nix
    ./modules/home/themes.nix
    ./modules/home/opencode.nix
  ];

  # Rebuilds KDE's sycoca database so Dolphin can find apps
  home.activation.rebuildKDECache = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
    export XDG_DATA_HOME="$HOME/.local/share"
    export XDG_DATA_DIRS="$HOME/.nix-profile/share:/run/current-system/sw/share"
    $DRY_RUN_CMD ${pkgs.kdePackages.kservice}/bin/kbuildsycoca6 --noincremental
  '';
}