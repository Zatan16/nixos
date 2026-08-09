{ pkgs, ... }:

{
  # 1. Enable Thunar + Plugins
  programs.thunar = {
    enable = true;
    plugins = with pkgs; [
      thunar-archive-plugin
      thunar-volman
    ];
  };

  # 2. Enable Yazi
  programs.yazi = {
    enable = true;
  };

  # 3. System Services (Thumbnails, USB Auto-mount, Trash)
  services.gvfs.enable = true;    # Mount USB drives, trash, network shares
  services.tumbler.enable = true; # Image/video thumbnails for Thunar

  # 4. Install Helper Packages Globally
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
  ];
}