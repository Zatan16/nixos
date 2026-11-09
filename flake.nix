{
  description = "Zayaan's NixOS Config";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    niri.url = "github:niri-wm/niri";
    noctalia.url = "github:noctalia-dev/noctalia/cachix";
    noctalia-v4.url = "github:noctalia-dev/noctalia/legacy-v4";
    nix-flatpak.url = "github:gmodena/nix-flatpak/?ref=v0.7.0";
    stylix.url = "github:danth/stylix";
    home-manager.url = "github:nix-community/home-manager/master";
    openclaw.url = "github:Scout-DJ/openclaw-nix";
    noctalia-greeter.url = "github:noctalia-dev/noctalia-greeter";
    opencode.url = "github:dan-online/opencode-nix";
    lmstudio.url = "github:Daaboulex/lmstudio-nix";
    freesmlauncher.url = "github:FreesmTeam/FreesmLauncher";
    umbriel.url = "github:noctalia-dev/umbriel";

    torlink = {
      url = "github:baairon/torlink";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    loaf = {
      # url = "github:Zatan16/loaf-fm";
      url = "github:m-uvex/loaf-fm";
    };
  };

  outputs = { self, nixpkgs, niri, stylix, nix-flatpak, home-manager, torlink, openclaw, opencode, lmstudio, freesmlauncher, loaf, umbriel, ...}@inputs: {
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = { inherit inputs; };
      modules = [
        ./hosts/nixos/configuration.nix
        umbriel.nixosModules.default
        nix-flatpak.nixosModules.nix-flatpak
        home-manager.nixosModules.home-manager
        stylix.nixosModules.stylix

        {
          nixpkgs.overlays = [
            torlink.overlays.default
            loaf.overlays.default

            # freesmlauncher.overlays.default

            opencode.overlays.default
            lmstudio.overlays.default
            niri.overlays.default

            # Installing neon-cursors
            (final: prev: {
              cyberpunk-neon-cursors = final.runCommand "cyperpunk-neon-cursors" {} ''
                mkdir -p $out/share/icons
                cp -r ${./assets/cursors/Cyberpunk-Neon} $out/share/icons/Cyberpunk-Neon
              '';
            })

            # Dolphin overlay for applications.menu for open-with menu
            (final: prev: {
              kdePackages = prev.kdePackages.overrideScope (kfinal: kprev: {
                dolphin = prev.symlinkJoin {
                  name = "dolphin-wrapped";
                  paths = [ kprev.dolphin ];
                  nativeBuildInputs = [ prev.makeWrapper ];
                  postBuild = ''
                    rm $out/bin/dolphin
                    makeWrapper ${kprev.dolphin}/bin/dolphin $out/bin/dolphin \
                      --set XDG_CONFIG_DIRS "${kprev.plasma-workspace}/etc/xdg:$XDG_CONFIG_DIRS" \
                      --run "${kprev.kservice}/bin/kbuildsycoca6 --noincremental ${kprev.plasma-workspace}/etc/xdg/menus/plasma-applications.menu"
                  '';
                };
              });
            })
          ];
        }

        {
          nix.settings = {
            substituters = [ 
              "https://cache.nixos-cuda.org"
              "https://noctalia.cachix.org"
              "https://umbriel.cachix.org"
            ];

            trusted-public-keys = [
              "cache.nixos-cuda.org:74DUi4Ye579gUqzH4ziL9IyiJBlDpMRn9MBN8oNan9M="
              "noctalia.cachix.org-1:pCOR47nnMEo5thcxNDtzWpOxNFQsBRglJzxWPp3dkU4="
              "umbriel.cachix.org-1:JfNq/2yg2S6D6z4Z2dVSZrZlDPQTKtexB6GAVLD98nw="
            ];
          };
        }
      ];
    };
  };
}
