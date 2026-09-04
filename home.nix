{ ... }:

{
  imports = [
    ./home/applications.nix
    ./home/mime.nix
    ./home/kitty.nix
  ];

  home.username = "zayaan";
  home.homeDirectory = "/home/zayaan";
  home.stateVersion = "26.05";
  programs.home-manager.enable = true;

  nixpkgs.config.allowUnfree = true;
}