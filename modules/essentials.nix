{ pkgs, ... }:

{
  # Ensure background hardware services are enabled
  services.upower.enable = true;     # Enables battery & power tracking for status bars
  hardware.bluetooth.enable = true;  # Enables bluetooth
  services.power-profiles-daemon.enable = true;   # Enable power profiles daemon

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
  ];
}