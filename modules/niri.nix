{ pkgs, niri, ... }:

{
  imports = [
    ./dms.nix
  ];

  nixpkgs.overlays = [
    niri.overlays.niri-nix
  ];

  # Enable niri
  programs.niri = {
    enable = true;
    package = pkgs.niri-unstable;
  };

  environment.systemPackages = with pkgs; [
    xwayland-satellite
  ];
}