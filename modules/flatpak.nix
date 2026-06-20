{ ... }:

{
  imports = [
    (fetchTarball "https://github.com/gmodena/nix-flatpak/archive/v0.7.0.tar.gz" + "/modules/nixos.nix")
  ];

  services.flatpak = {
    enable = true;
    packages = [
      "org.vinegarhq.Sober"
    ];
  };
}
