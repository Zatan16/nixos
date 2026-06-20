{ ... }:

{
  programs.dconf = {
  enable = true;
  
  profiles.user.databases = [ {
    lockAll = true;
      settings = {
        "org/gnome/desktop/interface" = {  # themes for nautilus
          color-scheme = "prefer-dark";
          icon-theme = "Numix";
          gtk-theme = "Numix";
        };
        "org/nemo/preferences" = {
          show-hidden-files = true;
          click-policy = "double";
          show-advanced-permissions = true;
          gtk-theme = "Numix";
        };
        "org/nemo/preferences/menu-config" = {
          selection-menu-open-as-root = true;
        };
        "org/cinnamon/desktop/applications/terminal" = {  # open-in-terminal in nemo launches this terminal
          exec = "alacritty";
        };
      };
    } ];
  };
}