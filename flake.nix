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
    # sddm-noctalia-theme = {
    #   url = "github:mda-dev/noctalia-sddm-theme";
    #   flake = false;
    # };
    noctalia-greeter.url = "github:noctalia-dev/noctalia-greeter";
    stylix = {
      url = "github:danth/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, niri-nix, stylix, noctalia-greeter, ...}@inputs: {
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = { inherit inputs; };
      modules = [
        ./configuration.nix
        niri-nix.nixosModules.default
        noctalia-greeter.nixosModules.default
        stylix.nixosModules.stylix
      ];
    };
  };
}
