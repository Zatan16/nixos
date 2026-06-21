{ ... }:

{
  home.stateVersion = "24.11";

  nixpkgs.config.allowUnfree = true;

  imports = [
    ./modules/home/games.nix
    ./modules/home/learn-hacking.nix
    ./modules/home/utilities.nix
    ./modules/home/vscode.nix
    ./modules/home/apps.nix
  ];
}