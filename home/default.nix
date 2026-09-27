{ ... }:

{
  imports = [
    ./core/applications.nix
    ./core/desktop-entries.nix
    ./core/mime.nix
    ./core/stylix.nix

    ./programs/file-manager.nix
    ./programs/kitty.nix
    ./programs/starship.nix
    ./programs/vscode.nix
    ./programs/godot.nix
  ];

  home.username = "zayaan";
  home.homeDirectory = "/home/zayaan";
  home.stateVersion = "26.05";
  programs.home-manager.enable = true;

  nixpkgs.config.allowUnfree = true;
}