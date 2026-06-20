{ pkgs, ...}:

{
  environment.systemPackages = with pkgs; [
    mindustry
  ];
}