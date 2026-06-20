{ pkgs, ... }:

{
  # Enable niri
  programs.niri = {
    enable = true;
  };

  environment.systemPackages = with pkgs; [
    xwayland-satellite
  ];
}