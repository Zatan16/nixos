{ pkgs, ... }:

{
  home.packages = with pkgs; [
    vscode
    nixd
  ];
}