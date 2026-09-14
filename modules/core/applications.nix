{ pkgs, ... }:

{
  # imports = [ ./gnome-keyring.nix ./flatpak.nix ./file-manager.nix ];

  environment.systemPackages = with pkgs; [
    git
    alacritty
    vivaldi
    vivaldi-ffmpeg-codecs
  ];

  programs.steam.enable = true;
  programs.gamescope = {
    enable = true;
    # capSysNice = true;  # Makes gamescope have the highest possible priority for cpu and other stuff
    # args = [ "--rt" ];
    args = [
      "--rt" 
      # "--prefer-vk-device" "10de:"
    ];

    env = {
      __NV_PRIME_RENDER_OFFLOAD = "1";
      __VK_LAYER_NV_optimus = "NVIDIA_only";
      __GLX_VENDOR_LIBRARY_NAME = "nvidia";
      # "MESA_VK_DEVICE_SELECT" = "10de:*";
      # "NVK_I915_DISABLE" = "1";
    };
  };
}