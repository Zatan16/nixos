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
  };
}