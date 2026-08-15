{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    (pkgs.python3.withPackages (ps: with ps; [
      tkinter
      pip
    ]))
  ];
}