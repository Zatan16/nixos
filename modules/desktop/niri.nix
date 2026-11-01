{ pkgs, inputs, ...}:

{
  # imports = [ ./noctalia-greeter.nix ];

  programs.niri = {
    enable = true;
    package = pkgs.niri-unstable;
  };

  nixpkgs.overlays = [ inputs.niri-nix.overlays.niri-nix ];

  services.displayManager.defaultSession = "niri";

  services.noctalia = {
    enable = true;
    v5 = true;
    # v4 = true;
  };
}