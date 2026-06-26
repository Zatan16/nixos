{
  description = "Zayaan's NixOS configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";

    home-manager = {
      url = "github:nix-community/home-manager/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";  # use the same nixpkgs as the system
    };

    nix-flatpak.url = "github:gmodena/nix-flatpak/?ref=v0.7.0";
  };

  outputs = { nixpkgs, home-manager, nix-flatpak, ... }: {
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        ./configuration.nix

        home-manager.nixosModules.home-manager
        {
          home-manager.useGlobalPkgs = true;   # use system nixpkgs (avoids double eval)
          home-manager.useUserPackages = true;  # install user packages into /etc/profiles
        }

        nix-flatpak.nixosModules.nix-flatpak
      ];
    };
  };
}