{ pkgs, ... }:

{
  nixpkgs.config.android_sdk.accept_license = true;

  environment.systemPackages = with pkgs; [
    androidenv.androidPkgs.androidsdk
    androidenv.androidPkgs.emulator
    androidenv.androidPkgs.ndk-bundle
    jdk
  ];
}