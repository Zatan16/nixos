{ pkgs, config, ... }:

{
  stylix = {
    enable = true;
    
    # Path to your wallpaper image (Stylix uses this to generate color palettes)
    # image = ./wallpaper.png; # Ensure wallpaper.png exists in your config directory
    
    # Or set an explicit base16 color scheme instead of image auto-generation:
    # base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-dark-hard.yaml";

    base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-mocha.yaml";
    image = config.lib.stylix.pixel "base00";

    polarity = "dark";

    icons = {
      enable = true;
      package = pkgs.papirus-icon-theme;
      dark = "Papirus-Dark";
      light = "Papirus-Dark";
    };

    fonts.sizes = {
      popups = 10;
      applications = 12;
      desktop = 10;
    };
  };
}