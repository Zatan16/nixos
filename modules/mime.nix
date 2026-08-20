{ ... }:

{
  xdg.mime = {
    enable = true;
    defaultApplications = {
      "inode/directory" = "thunar.desktop";
      "text/html" = "gedit.desktop";
      "application/pdf" = "evince.desktop";
    };
  };
}