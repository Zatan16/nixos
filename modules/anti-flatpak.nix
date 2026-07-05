{ lib, ... }:

{
  services.flatpak.enable = lib.mkForce false;
}