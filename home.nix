{ ... }:

{
  home.stateVersion = "24.11";

  imports = [
    ./modules/home/games.nix
    ./modules/home/learn-hacking.nix
  ];
}