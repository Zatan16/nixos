{ ... }:

{
  # services.tlp = {
  #   enable = true;
  #   pd.enable = true;

  #   settings = {
  #     CPU_SCALING_GOVERNOR_ON_AC  = "performance";
  #     CPU_SCALING_GOVERNOR_ON_BAT = "powersave";
  #     CPU_ENERGY_PERF_POLICY_ON_AC  = "balance_performance";
  #     CPU_ENERGY_PERF_POLICY_ON_BAT = "power";   # intel_pstate / amd-pstate EPP
  #     CPU_BOOST_ON_BAT = 0;                      # disabling turbo saves a lot
  #     PLATFORM_PROFILE_ON_BAT = "low-power";
  #     CPU_MAX_PERF_ON_BAT = 60;                  # Intel only; cap max freq
  #     WIFI_PWR_ON_BAT = "on";
  #     USB_AUTOSUSPEND = 1;
  #     PCIE_ASPM_ON_BAT = "powersupersave";
  #     RUNTIME_PM_ON_BAT = "auto";
  #     SATA_LINKPWR_ON_BAT = "min_power";
  #     # Battery longevity (if your laptop supports thresholds)
  #     START_CHARGE_THRESH_BAT0 = 40;
  #     STOP_CHARGE_THRESH_BAT0  = 80;
  #   };
  # };

  # powerManagement.enable = true;
  # powerManagement.powertop.enable = true;   # applies powertop auto-tune at boot
  # services.thermald.enable = true;          # Intel only

  # boot.kernelParams = [
  #   "pcie_aspm.policy=powersupersave"
  #   "nvme.noacpi=1"                         # only if NVMe idle power is bad; test it
  #   # AMD: "amd_pstate=active"
  #   # Intel: i915.enable_psr=1 is usually default on newer kernels
  # ];

  # zramSwap.enable = true;                   # less disk I/O than swapfile
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