{ pkgs, ... }:

{
  # Enable DMS
  programs.dms-shell = {
    enable = true;

      systemd = {
        enable = true;
        restartIfChanged = true;
      };

    enableSystemMonitoring = true;
    enableVPN = true;
    enableDynamicTheming = true;
    enableAudioWavelength = true;
    enableCalendarEvents = true;
    enableClipboardPaste = true;

    # `nurl <github-link>` to get the src detials for the plugin
    plugins = with pkgs; {
      ScreenRecorder = {
        src = fetchFromGitHub {
          owner = "arqueon";
          repo = "dms-screen-recorder";
          rev = "40364a8530f4364e2fd6b0eb8802d5fe4f241b8f";
          hash = "sha256-/SeQSlPeM0jDHg4yFmR82ODtnVs2bOovVG7TCMjH1vk=";
        };
      };
    };
  };

  environment.systemPackages = with pkgs; [
    nurl
  ];
}