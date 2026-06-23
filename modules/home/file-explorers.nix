{ pkgs, ... }:

{
  home.packages = with pkgs; [
    # GNOME file manager
    nautilus
    nautilus-open-any-terminal

    # KDE file manager
    kdePackages.dolphin
    kdePackages.kio
    kdePackages.kio-extras
    kdePackages.kio-fuse
    kdePackages.kde-cli-tools
    kdePackages.kservice  # Fixes dolphin app detection (provides kbuildsycoca6)

    # Cinnamon file manager
    nemo-with-extensions
    nemo-fileroller

    # Archive manager + backends
    file-roller
    zip
    unzip
    p7zip
    unrar

    # GTK theme switcher (for previewing themes)
    nwg-look

    # Needed for Dolphin to open files via xdg
    xdg-utils
  ];

  # Add missing applications.menu needed by Dolphin
  xdg.configFile."menus/applications.menu".text = ''
    <!DOCTYPE Menu PUBLIC "-//freedesktop//DTD Menu 1.0//EN"
      "http://www.freedesktop.org/standards/menu-spec/menu-1.0.dtd">
    <Menu>
      <Name>Applications</Name>
      <DefaultAppDirs/>
      <DefaultDirectoryDirs/>
      <DefaultMergeDirs/>
    </Menu>
  '';

  dconf.settings = {
    "org/nemo/preferences" = {
      show-hidden-files = true;
      click-policy = "double";
      show-advanced-permissions = true;
    };
    "org/nemo/preferences/menu-config" = {
      selection-menu-open-as-root = true;
    };
    "org/cinnamon/desktop/applications/terminal" = {
      exec = "alacritty";
    };
  };
}