{
  description = "Zayaan's NixOS Config";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    niri-nix = {
      url = "git+https://codeberg.org/BANanaD3V/niri-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    noctalia = {
      url = "github:noctalia-dev/noctalia/legacy-v4";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-flatpak.url = "github:gmodena/nix-flatpak/?ref=v0.7.0";
    stylix = {
      url = "github:danth/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    torlink = {
      url = "github:baairon/torlink";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    openclaw = {
      url = "github:Scout-DJ/openclaw-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    # xwayland-satellite = {
    #   url = "github:Supreeeme/xwayland-satellite/536bd32efc935bf876d6de385ec18a1b715c9358";
    #   inputs.nixpkgs.follows = "nixpkgs";
    # };
  };

  outputs = { self, nixpkgs, niri-nix, stylix, nix-flatpak, home-manager, torlink, openclaw, ...}@inputs: {
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = { inherit inputs; };
      modules = [
        ./configuration.nix
        niri-nix.nixosModules.default
        # noctalia-greeter.nixosModules.default
        stylix.nixosModules.stylix
        nix-flatpak.nixosModules.nix-flatpak
        home-manager.nixosModules.home-manager

        ({ ... }: {
          nixpkgs.overlays = [
            torlink.overlays.default

            # Patch xwayland-satellite bug for steam's context menus
            (final: prev: {
              xwayland-satellite = prev.xwayland-satellite.overrideAttrs (
                _finalAttrs: prevAttrs:
                  assert prevAttrs.version == "0.8.2"; {
                    patches =
                      (prevAttrs.patches or [])
                      ++ [
                        (final.fetchpatch2 {
                          name = "xwayland-satellite-override-redirect-fix+pr=494.diff";
                          url = "https://github.com/Supreeeme/xwayland-satellite/compare/55d2dd8ee2b84288778e953cdc1b096da21bb153~...9d51b59ff3c38464e7654096c9b10a8052a26b25.diff?full_index=1";
                          hash = "sha256-VpdX1V9N0pkBJoRuqTwZiwJeW4h200TdsPN75xnBSEk=";
                        })
                      ];
                  }
              );
            })
          ];
        })
      ];
    };
  };
}
