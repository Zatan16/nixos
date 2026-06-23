{ pkgs, config, ... }:

{
  dconf.enable = true;

  home.packages = with pkgs; [
    gsettings-desktop-schemas  # Without this, color-scheme/gtk-theme keys are ignored
    glib
  ];

  # GTK theming
  gtk = {
    enable = true;
    theme = {
      name = "Numix";
      package = pkgs.numix-gtk-theme;
    };
    iconTheme = {
      name = "Papirus-Dark";    # switched from Numix — better KDE/GTK coverage
      package = pkgs.papirus-icon-theme;
    };
    gtk3.extraConfig = {
      gtk-application-prefer-dark-theme = 1;
    };
    gtk4.theme = config.gtk.theme;    # silences the stateVersion warning
  };

  # Qt theming — makes Dolphin and other Qt apps follow GTK dark theme
  qt = {
    enable = true;
    platformTheme.name = "gtk";
    style = {
      name = "adwaita-dark";
      package = pkgs.adwaita-qt6;
    };
  };

  # Dark mode + icon/theme settings for GTK apps like Nemo
  dconf.settings = {
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
      icon-theme = "Papirus-Dark";
      gtk-theme = "Numix";
    };
  };
}