{
  xdg.mimeApps = {
    enable = true;
    defaultApplications = {
      "inode/directory" = "thunar.desktop";
      "text/html" = "gedit.desktop";
      "application/pdf" = "evince.desktop";
      "text/*" = "gedit.desktop";
      "image/*" = "viewnior.desktop";
      "application/octet-stream" = "gedit.desktop";  # Extensionless File
      "application/zip" = "org.gnome.FileRoller.desktop";
      "application/x-tar" = "org.gnome.FileRoller.desktop";
      "application/gzip" = "org.gnome.FileRoller.desktop";
    };
  };
}