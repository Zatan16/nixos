{ ... }:

{
  # Limit boot generations strictly to 10 on every rebuild
  boot.loader.systemd-boot.configurationLimit = 10;

  # Automatically clean up orphaned packages from deleted generations
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 14d";
  };
}