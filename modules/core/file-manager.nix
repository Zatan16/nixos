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
    imagemagick        # Image previews

    # Thunar Archive GUI
    file-roller

    # For file thumbnails
    tumbler

    # Create User Folders like Documents, Downloads, etc.
    # NOTE: Run `xdg-user-dirs-update --force` later
    xdg-user-dirs
    xdg-user-dirs-gtk
  ];
}