{ pkgs, ... }:

{
  imports = [ ./starship.nix ];

  environment.systemPackages = [ pkgs.kitty ];
  programs.zoxide = {
    enable = true;
  };

  programs.atuin = {
    enable = true;
    flags = [ "--disable-up-arrow" "--disable-ctrl-r" ];
    settings = {
      search_mode = "fuzzy";
      style = "compact";
      auto_sync = false;
    };
  };

  programs.zsh.interactiveShellInit = ''
    bindkey '^R' undefined-key
    bindkey '^F' atuin-search
  '';
}