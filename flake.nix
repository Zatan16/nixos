{
  description = "Zayaan's NixOS configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";  # use the same nixpkgs as the system
    };

    nix-flatpak.url = "github:gmodena/nix-flatpak/?ref=v0.7.0";

    niri.url = "github:sodiboo/niri-flake";

    dms.url = "github:AvengeMedia/DankMaterialShell";
  };

  outputs = { nixpkgs, home-manager, nix-flatpak, niri, dms, ... }: {
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        ./configuration.nix

        home-manager.nixosModules.home-manager

        {
          home-manager.useGlobalPkgs = true;   # use system nixpkgs (avoids double eval)
          home-manager.useUserPackages = true;  # install user packages into /etc/profiles
          home-manager.sharedModules = [
            dms.homeModules.dank-material-shell
          ];
        }

        nix-flatpak.nixosModules.nix-flatpak

        niri.nixosModules.niri
        
        dms.nixosModules.dank-material-shell
        dms.nixosModules.greeter   
      ];
    };
  };
}