{ ... }:

{
  programs.starship = {
    enable = true;
    enableBashIntegration = true;
    enableZshIntegration = true;
    settings = fromTOML (builtins.readFile ../../dotfiles/starship/pastel-powerline.toml) // {};
  };

  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    enableCompletion = true;
  };

  programs.bash.enable = true;
}