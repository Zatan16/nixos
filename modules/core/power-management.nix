{ ... }:

{
  powerManagement.enable = true;
  powerManagement.powertop.enable = true;   # applies powertop auto-tune at boot
  services.thermald.enable = true;          # Intel only

  networking.networkmanager.wifi.powersave = true;
  hardware.bluetooth.powerOnBoot = false;

  boot.kernelParams = [
    "pcie_aspm.policy=powersupersave"
    # "nvme.noacpi=1"                         # only if NVMe idle power is bad; test it
    # AMD: "amd_pstate=active"
    # Intel: i915.enable_psr=1 is usually default on newer kernels
  ];

  zramSwap.enable = true;                   # less disk I/O than swapfile
  # services.journald.settings.Journal.SystemMaxUse = "200M";

  services.tuned = {
    enable = true;
    ppdSupport = true;             # enables tuned-ppd (power-profiles-daemon API)

    ppdSettings = {
      main = {
        default = "balanced";
        battery_detection = true;  # use the [battery] mapping when on battery
      };
      profiles = {
        power-saver = "my-saver";
        balanced    = "balanced";
        performance = "throughput-performance";
      };
      battery = {
        balanced = "balanced-battery";   # balanced maps to this on battery
      };
    };
    
    profiles.my-saver = {
      main.include = "powersave";
      cpu = {
        energy_performance_preference = "power";
        no_turbo = true;               # disable boost
      };
      sysfs = {
        "/sys/module/pcie_aspm/parameters/policy" = "powersupersave";
      };
      video.radeon_powersave = "dpm-battery";
    };
  };
}