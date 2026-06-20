{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    vscode
    nixd
  ];

  programs.nix-ld.enable = true;  # For KDL LSP
}