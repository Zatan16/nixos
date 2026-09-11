{ ... }:

{
  xdg.desktopEntries = {
    # steam = {
    #   name = "Steam";
    #   comment = "Steam (Gamescope)";
    #   exec = "gamescope -e -W 1920 -H 1080 -r 60 -f -- steam -nobigpicture";
    #   icon = "steam";
    #   categories = [ "Game" "Network" ];
    #   actions = {
    #     regular = {
    #       name = "Steam (No Gamescope)";
    #       exec = "steam";
    #     };
    #   };
    # };

    "org.vinegarhq.Sober" = {
      name = "Sober";
      comment = "Roblox";
      exec = "nvidia-offload flatpak run --branch=stable --arch=x86_64 --command=sober --file-forwarding org.vinegarhq.Sober -- @@u %u @@";
      icon = "org.vinegarhq.Sober";
      categories = [ "Game" ];
    };
  };
}