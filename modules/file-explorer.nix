{ pkgs, ... }:

{
  # Nautilus module placeholder — return a valid attribute set
  environment.systemPackages = with pkgs; [
    nautilus
    nautilus-open-any-terminal
    numix-icon-theme
    numix-gtk-theme
    nwg-look

    kdePackages.dolphin
    kdePackages.kio
    kdePackages.kio-extras
    kdePackages.kio-fuse

    nemo-with-extensions
    nemo-fileroller

    file-roller
  ];

  xdg.portal = {
    enable = true;
    config = {
      niri = {
        # default = lib.mkForce [ "kde" ];
      };
    };
    configPackages = with pkgs; [
      kdePackages.xdg-desktop-portal-kde
      xdg-desktop-portal-gnome
    ];
  };

  programs.nautilus-open-any-terminal = {
    enable = true;
    terminal = "alacritty";
  };

  services.gvfs.enable = true;    # Virtual Filesystems (trash/network)
  services.udisks2.enable = true;    # Drive Mounting

  xdg.mime = {    # default filetype handler
    enable = true;
    defaultApplications = {
      "inode/directory" = [ "nemo.desktop" ];
      "application/x-gnome-saved-search" = [ "nemo.desktop" ];
    };
  };
}