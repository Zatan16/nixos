{ pkgs, ... }:

{
  users.users.zayaan = {
    extraGroups = [ "adbusers" ];
  };

  environment.systemPackages = with pkgs; [
    android-tools
    androidenv.androidPkgs.platform-tools
  ];
}