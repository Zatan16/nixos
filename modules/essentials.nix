{ pkgs, ... }:

{
  imports = [ ./python.nix ];

  # Ensure background hardware services are enabled
  services.upower.enable = true;     # Enables battery & power tracking for status bars
  hardware.bluetooth.enable = true;  # Enables bluetooth
  # services.power-profiles-daemon.enable = true;   # Enable power profiles daemon
  services.tlp = {                   # Power Management Daemon
    enable = true;
    pd.enable = true;

    settings = {
      CPU_SCALING_GOVERNOR_ON_AC = "performance";
      CPU_SCALING_GOVERNOR_ON_BAT = "powersave";

      CPU_ENERGY_PERF_POLICY_ON_AC = "performance";
      CPU_ENERGY_PERF_POLICY_ON_BAT = "power";

      PLATFORM_PROFILE_ON_BAT = "low-power";

      # TLP_DEFAULT_MODE = "SAV";
      # TLP_PERSISTENT_DEFAULT = 1;

      CPU_BOOST_ON_BAT = 0;
      CPU_HWP_DYN_BOOST_ON_BAT = 0;
    };
  };
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

    # NodeJS
    nodejs_22
  ];
}