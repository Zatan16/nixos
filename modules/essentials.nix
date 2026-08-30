{ pkgs, ... }:

{
  imports = [ ./python.nix ];

  # Ensure background hardware services are enabled
  services.upower.enable = true;     # Enables battery & power tracking for status bars
  hardware.bluetooth.enable = true;  # Enables bluetooth
  services.power-profiles-daemon.enable = true;   # Enable power profiles daemon
  programs.xwayland.enable = true;   # Enables X11 support on Walyand
  hardware.uinput.enable = true;     # Enables applications to create virtual input devices

  environment.systemPackages = with pkgs; [
    # Hardware identification
    pciutils
    usbutils
    lshw
    lm_sensors
    libinput

    # Power & Battery
    acpi

    # System Monitoring & Stats
    btop
    fastfetch
    sysstat

    # Clipboard
    wl-clipboard
    # wtype
    dotool

    # Emojis
    bemoji
    fuzzel

    # Xorg in Wayland
    xwayland-satellite

    # Intel Driver for VAAPI
    intel-media-driver
  ];
}