{ pkgs, lib, ... }:

{
  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [      # ← use extraPortals for implementations
      kdePackages.xdg-desktop-portal-kde
      xdg-desktop-portal-gnome
    ];
    config = {
      niri = {
        default = lib.mkDefault [ "kde" ];
      };
    };
  };

  programs.nautilus-open-any-terminal = {
    enable = true;
    terminal = "alacritty";
  };

  services.gvfs.enable = true;  # Virtual Filesystem (trash/network)
  services.udisks2.enable = true;  # Drive Mounting
}