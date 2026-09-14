{ ... }:

{
  imports = [ ./starship.nix ];

  programs.kitty = {
    enable = true;
    extraConfig = "
    ${builtins.readFile ../../assets/kitty/noctalia.conf}
      scrollback_lines 10000
    ";

    settings = {
      confirm_os_window_close = 0;
      # shell_integration = "no-rc";
    };
  };
}