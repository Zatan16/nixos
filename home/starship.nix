{ ... }:

{
  programs.starship = {
    enable = true;
    enableBashIntegration = true;
    settings = fromTOML (builtins.readFile ../assets/starship/pastel-powerline.toml) // {};
  };

  programs.bash = {
    enable = true;
    enableCompletion = true;
  };
}