{ pkgs, ... }:

{
  stylix = {
    enable = true;
    
    # Path to your wallpaper image (Stylix uses this to generate color palettes)
    # image = ./wallpaper.png; # Ensure wallpaper.png exists in your config directory
    
    # Or set an explicit base16 color scheme instead of image auto-generation:
    # base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-dark-hard.yaml";

    polarity = "dark"; # "dark" or "light"

    # Optional: Customize default fonts across GTK, Qt, terminal, etc.
    # fonts = {
    #   monospace = {
    #     package = pkgs.nerd-fonts.jetbrains-mono;
    #     name = "JetBrainsMono Nerd Font";
    #   };
    #   sansSerif = {
    #     package = pkgs.dejavu_fonts;
    #     name = "DejaVu Sans";
    #   };
    # };
  };
}