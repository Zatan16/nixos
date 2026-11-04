{ pkgs, ... }:

{
  # imports = [ ./python.nix ];

  # Ensure background hardware services are enabled
  services.upower.enable = true;     # Enables battery & power tracking for status bars
  hardware.bluetooth.enable = true;  # Enables bluetooth
  programs.xwayland.enable = true;   # Enables X11 support on Walyand
  hardware.uinput.enable = true;     # Enables applications to create virtual input devices

  # services.acpid.enable = true;

  # For totem
  services.gnome.tinysparql.enable = true;
  services.gnome.localsearch.enable = true;

  programs.umbriel.enable = true;

  # To run non-nix dependencies
  programs.nix-ld = {
    enable = true;
    libraries = with pkgs; [
      stdenv.cc.cc
      zlib
    ];
  };

  environment.systemPackages = with pkgs; [
    # Hardware identification
    pciutils
    usbutils
    lshw
    lm_sensors
    libinput
    brightnessctl

    # Power & Battery
    acpi

    # System Monitoring & Stats
    btop
    nvtopPackages.full
    fastfetch
    sysstat

    # Clipboard
    wl-clipboard

    # wtype
    dotool
    wtype

    # Emojis
    # bemoji
    # fuzzel

    # Xorg in Wayland
    xwayland-satellite

    # Intel Driver for VAAPI
    intel-media-driver

    # NodeJS
    nodejs_22

    # SSD Health
    smartmontools

    pulseaudio

    # QR Code generator
    qrencode

    # Themes
    bibata-cursors
    papirus-icon-theme
    gnome-themes-extra
    adw-gtk3

    tree

    acpid

    keyd

    linuxKernel.packages.linux_7_3.turbostat
  ];
}