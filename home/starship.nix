{ ... }:

{
  programs.starship = {
    enable = true;
    enableBashIntegration = true;
    enableZshIntegration = true;
    settings = fromTOML (builtins.readFile ../assets/starship/pastel-powerline.toml) // {};
  };

  programs.zsh = {
    # enable = true;
    autosuggestion.enable = true;
    enableCompletion = true;
    # initContent = ''
    #   eval "$(starship init zsh)"
    # '';
  };

  programs.bash.enable = true;
}