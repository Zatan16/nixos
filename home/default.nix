{ ... }:

{
  imports = [
    ./core/applications.nix
    ./core/desktop-entries.nix

    ./programs/file-manager.nix
    ./programs/vscode.nix
    ./programs/godot.nix
  ];

  home = {
    username = "zayaan";
    homeDirectory = "/home/zayaan";
    stateVersion = "26.05";
    backupFileExtension = "backup";
  };

  programs.home-manager.enable = true;

  home.file.".ssh/config".text = ''
    Host phone
      HostName 192.168.1.5
      Port 8022
      User u0_a123
  '';
}