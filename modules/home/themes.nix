{ pkgs, config, ... }:

{
  dconf.enable = true;

  home.packages = with pkgs; [
    gsettings-desktop-schemas  # Without this, color-scheme/gtk-theme keys are ignored
    glib
    qt6Packages.qt6ct  # Reads qt6ct.conf to apply Qt settigns

    kdePackages.breeze
    papirus-icon-theme
  ];

  # GTK theming
  gtk = {
    enable = true;
    theme = {
      name = "Numix";
      package = pkgs.numix-gtk-theme;
    };
    iconTheme = {
      name = "Numix";
      package = pkgs.numix-icon-theme;
    };
    gtk3.extraConfig = {
      gtk-application-prefer-dark-theme = 1;
    };
    gtk4.theme = config.gtk.theme;    # silences the stateVersion warning
  };

  # Qt theming — makes Dolphin and other Qt apps follow Qt dark theme
  qt = {
    enable = true;
    platformTheme.name = "qt6ct";
    style = {
      name = "adwaita-dark";
      package = pkgs.adwaita-qt6;
    };
  };

  # Apply Papirus for Qt applications
  # xdg.configFile."qt6ct/qt6ct.conf".text = ''
  #   [Appearance]
  #   icon_theme=Papirus-Dark
  #   style=adwaita-dark
  # '';

  xdg.dataFile."icons/NumixPapirus/index.theme".text = ''
    [Icon Theme]
    Name=NumixPapirus
    Comment=Numix with Papirus fallback
    Inherits=Numix,Papirus
  '';

  # Set color scheme for KDE apps like Dolphin
  xdg.configFile."kdeglobals".text = ''
    [General]
    ColorScheme=BreezeDark

    [KDE]
    LookAndFeelPackage=org.kde.breezedark.desktop
  '';

  # Dark mode + icon/theme settings for GTK apps like Nemo
  dconf.settings = {
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
      # icon-theme = "Numix";
      gtk-theme = "Numix";
    };
  };
}