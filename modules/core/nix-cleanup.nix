{ ... }:

{
  # Limit boot generations strictly to 3 on every rebuild
  boot.loader.systemd-boot.configurationLimit = 3;

  # Automatically clean up orphaned packages from deleted generations
  # nix.gc = {
  #   automatic = true;
  #   dates = "weekly";
  #   options = "--delete-older-than 14d";
  # };

  programs.nh = {
    enable = true;
    clean = {
      enable = true;
      extraArgs = "--keep 3";
    };
    flake = "/etc/nixos";
  };
}