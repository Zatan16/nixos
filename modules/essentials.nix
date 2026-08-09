{ pkgs, ... }:

{
  # Ensure background hardware services are enabled
  hardware.lm_sensors.enable = true; # Enables hardware temperature sensors
  services.upower.enable = true;     # Enables battery & power tracking for status bars
  hardware.bluetooth.enable = true;  # Enables bluetooth
  services.power-profiles-daemon.enable = true;   # Enable power profiles daemon

  environment.systemPackages = with pkgs; [
    # Hardware identification
    pciutils
    usbutils
    lshw
    lm_sensors

    # Power & Battery
    acpi
    upower

    # System Monitoring & Stats
    btop
    fastfetch
    sysstat

    # Clipboard
    wl-clipboard
  ];
}