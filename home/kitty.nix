{ ... }:

{
  imports = [ ./starship.nix ];

  programs.kitty = {
    enable = true;
    # themeFile = "Noctalia";
    extraConfig = "
    ${builtins.readFile ../assets/kitty/noctalia.conf}
      scrollback_lines 10000
    ";

    settings = {
      confirm_os_window_close = 0;
    };
  };
}