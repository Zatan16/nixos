{ pkgs, config, ... }:


{
  boot = {
    plymouth = {
      enable = true;

      # theme = "rings"; # Set to your preferred theme name
      # themePackages = with pkgs; [
      #   (adi1090x-plymouth-themes.override {
      #     selected_themes = [ "rings" ]; # Only builds the selected theme
      #   })
      # ];
    };

    consoleLogLevel = 0;
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

  stylix = {
    enable = true;
    autoEnable = false;
    # image = config.lib.stylix.pixel "base00";
    base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-dark-hard.yaml";

    targets =  {
      plymouth.enable = true;
    };
  };
}