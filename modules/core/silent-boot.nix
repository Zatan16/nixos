{ pkgs, ... }:

{
  # boot = {
  #   # Enable graphical splash screen
  #   plymouth = {
  #     enable = true;
  #     theme = "rings"; # or another theme from adi1090x-plymouth-themes
  #     themePackages = with pkgs; [
  #       (adi1090x-plymouth-themes.override {
  #         selected_themes = [ "rings" ];
  #       })
  #     ];
  #   };

  #   # Hide boot menu immediately
  #   loader.timeout = 0;

  #   # Suppress text output
  #   consoleLogLevel = 0;
  #   initrd.verbose = false;
  #   kernelParams = [
  #     "quiet"
  #     "splash"
  #     "rd.systemd.show_status=false"
  #     "rd.udev.log_level=3"
  #     "udev.log_priority=3"
  #   ];
  # };

  # boot = {
  #   # Direct systemd and kernel output to quiet mode
  #   consoleLogLevel = 0;
  #   initrd.verbose = false;

  #   kernelParams = [
  #     "quiet"
  #     "splash"
  #     "loglevel=0"
  #     "systemd.show_status=false"
  #     "rd.systemd.show_status=false"
  #     "rd.udev.log_level=3"
  #     "vt.global_cursor_default=0" # hides blinking TTY cursor
  #   ];

  #   plymouth.enable = true;
  # };

  boot = {
    plymouth = {
      enable = true;
      # theme = "nixos-bgrt";
      # themePackages = [ pkgs.nixos-bgrt-plymouth ];
    };

    # Needed so Plymouth starts early (and shows the LUKS prompt if you use one)
    initrd.systemd.enable = true;
    initrd.verbose = false;

    consoleLogLevel = 3;
    kernelParams = [
      "quiet"
      "splash"
      "boot.shell_on_fail"
      "udev.log_priority=3"
      "rd.systemd.show_status=auto"
    ];

    # Hide the bootloader menu (hold Space or any key during boot to bring it back)
    loader.timeout = 0;
  };
}