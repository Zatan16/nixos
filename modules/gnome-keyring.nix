{ pkgs, ... }:

{
    services.gnome.gnome-keyring.enable = true;
    environment.systemPackages = [ pkgs.libsecret ];
    security.pam.services.greetd.enableGnomeKeyring = true;

    # Press Ctrl+Shift+P and open "Preferences: Configure Runtime Arguments" and add the following line:
    # "password-store": "gnome-libsecret"
}