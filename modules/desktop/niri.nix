{ pkgs, ...}:

{
  programs.niri.enable = true;

  services.displayManager.defaultSession = "niri";

  services.noctalia = {
    enable = true;
    v5 = true;
    # v4 = true;
  };
}