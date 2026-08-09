{ pkgs, ... }:

{
  # Enable Thunar + Plugins
  programs.thunar = {
    enable = true;
    plugins = with pkgs; [
      thunar-archive-plugin
      thunar-volman
    ];
  };

  # Enable Yazi
  programs.yazi = {
    enable = true;
  };

  # System Services (Thumbnails, USB Auto-mount, Trash)
  services.gvfs.enable = true;    # Mount USB drives, trash, network shares
  services.tumbler.enable = true; # Image/video thumbnails for Thunar

  # Install Helper Packages Globally
  environment.systemPackages = with pkgs; [
    # Yazi Preview & Search Helpers
    ffmpegthumbnailer # Video previews
    p7zip              # Archive previews/extraction
    jq                 # JSON formatting
    poppler            # PDF thumbnails (`pdftoppm`)
    fd                 # File search
    ripgrep            # Text search
    fzf                # Fuzzy finding
    zoxide             # Smart directory navigation
    imagemagick        # Image previews

    # Thunar Archive GUI
    file-roller

    papirus-icon-theme   # Provides Papirus-Dark
    adwaita-icon-theme   # Fallback icons
    hicolor-icon-theme   # Base XDG icon theme specification
    glib  # provides gsettings
  ];

  # 2. Force Environment Variables for GTK3 / Wayland
  environment.sessionVariables = {
    GTK_THEME = "Adwaita:dark";
    XDG_DATA_DIRS = [
      "/run/current-system/sw/share"
    ];
  };

  # 3. Create global GTK configuration files
  environment.etc = {
    "xdg/gtk-3.0/settings.ini".text = ''
      [Settings]
      gtk-theme-name=Adwaita-dark
      gtk-icon-theme-name=Papirus-Dark
      gtk-cursor-theme-name=Adwaita
      gtk-application-prefer-dark-theme=1
    '';
  };

  # 4. Link icon share directories system-wide
  environment.pathsToLink = [ "/share/icons" ];

  # 5. DBus & Portal support
  services.dbus.packages = [ pkgs.gsettings-desktop-schemas ];
  programs.dconf.enable = true;
}