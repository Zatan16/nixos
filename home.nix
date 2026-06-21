{ pkgs, ... }:

{
  home.stateVersion = "24.11";

  imports = [
    ./modules/home/games.nix
  ];

  home.packages = with pkgs; [

  ];
}