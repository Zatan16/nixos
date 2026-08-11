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

    # For file thumbnails
    tumbler

    # Create User Folders like Documents, Downloads, etc.
    # NOTE: Run `xdg-user-dirs-update --force` later
    xdg-user-dirs
    xdg-user-dirs-gtk

    papirus-icon-theme   # Provides Papirus-Dark
    adwaita-icon-theme   # Fallback icons
    hicolor-icon-theme   # Base XDG icon theme specification
    glib  # provides gsettings
  ];

  # 2. Force Environment Variables for GTK3 / Wayland
  environment.sessionVariables = {
    GTK_THEME = "Adwaita:dark";
    # XDG_DATA_DIRS = [
    #   "/run/current-system/sw/share"
    # ];
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

  system.userActivationScripts.gtkBookmarks = {
  text = ''
    BOOKMARKS_FILE="$HOME/.config/gtk-3.0/bookmarks"
    mkdir -p "$HOME/.config/gtk-3.0"
    touch "$BOOKMARKS_FILE"

    for folder in Documents Downloads Music Pictures Videos; do
      LINE="file://$HOME/$folder"
      if ! grep -qF "$LINE" "$BOOKMARKS_FILE"; then
        echo "$LINE" >> "$BOOKMARKS_FILE"
      fi
    done
    '';
  };
}