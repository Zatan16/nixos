{ config, lib, inputs, pkgs, ... }:

let
  cfg = config.services.noctalia;
in {
  options.services.noctalia = {
    enable = lib.mkEnableOption "Enable Noctalia Shell and Greeter";

    version = lib.mkOption {
      type = lib.types.enum [ 4 5 ];
      default = 5;
      description = "Version of Noctalia to configure";
    };
  };

  config = lib.mkIf cfg.enable (lib.mkMerge [
    # Noctalia V4
    (lib.mkIf (cfg.version == 4) {
      environment.systemPackages = [
        inputs.noctalia-v4.packages.${pkgs.stdenv.hostPlatform.system}.default
      ];

      services.displayManager.noctalia-greeter = {
        enable = true;
        settings = {
          session.default = "niri-session";
          user.default = "zayaan";
        };
      };
    })

    # Noctalia V5
    (lib.mkIf (cfg.version == 5) {
      services.displayManager.noctalia-greeter = {
        enable = true;
        settings = {
          cursor.size = 24;
          keyboard.layout = "us";
          idle = { timeout = 0; };
        };
        cursorTheme = {
          package = pkgs.bibata-cursors;
          name = "Bibata-Modern-Classic";
        };
        extraArgs = [
          "--no-dmps"
        ];
      };

      systemd.services.greetd.environment = {
        WLR_NO_HARDWARE_CURSORS = "1";
        WLR_RENDERER = "vulkan";
      };

      users.extraUsers.greeter = {
        extraGroups = [ "video" "render" ];
      };

      home-manager.users.zayaan = {
        imports = [ inputs.noctalia.homeModules.default ];

        programs.noctalia = {
          enable = true;
          systemd.enable = true;
          settings = {};
        };
      };
    })
  ]);
}