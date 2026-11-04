{ pkgs, inputs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix

      ../../modules
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.kernelPackages = pkgs.linuxPackages_7_3;

  boot.kernelModules = [ "rtw89_8852be" ];
  hardware.enableAllFirmware = true;

  networking.hostName = "nixos";
  networking.networkmanager.enable = true;

  time.timeZone = "Asia/Kolkata";
  location.provider = "geoclue2";
    services.geoclue2 = {
    enable = true;
    geoProviderUrl = "https://api.beacondb.net/v1/geolocate";
  };   

  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_IN";
    LC_IDENTIFICATION = "en_IN";
    LC_MEASUREMENT = "en_IN";
    LC_MONETARY = "en_IN";
    LC_NAME = "en_IN";
    LC_NUMERIC = "en_IN";
    LC_PAPER = "en_IN";
    LC_TELEPHONE = "en_IN";
    LC_TIME = "en_IN";
  };

  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  users.users."zayaan" = {
    isNormalUser = true;
    description = "Zayaan";
    extraGroups = [ "networkmanager" "wheel" "input" "uinput" "video" "render" ];
  };

  home-manager.users.zayaan = import ../../home;
  home-manager.extraSpecialArgs = { inherit inputs; };

  programs.zsh = {
    enable = true;
    interactiveShellInit = ''
      bindkey '^R' undefined-key
      bindkey '^F' atuin-search
      bindkey '^[[1;5C' forward-word
      bindkey '^[[1;5D' backward-word
    '';
  };
  users.defaultUserShell = pkgs.zsh;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Make suspend instant
  systemd.services.systemd-suspend.environment = {
    SYSTEMD_SLEEP_FREEZE_USER_SESSIONS = "false";
  };

  services.keyd = {
    enable = true;
    keyboards = {
      default = {
        ids = [
          "k:*"
        ];
        settings = {
          alt = {
            left = "home";
            right = "end";
          };
        };
      };
    };
  };

  system.stateVersion = "26.05";
}
