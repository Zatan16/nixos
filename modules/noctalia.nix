{ pkgs, inputs, ... }:

{
  imports = [ ./noctalia-greeter.nix ];

  environment.systemPackages = with pkgs; [
    inputs.noctalia.packages.${stdenv.hostPlatform.system}.default
  ];
}