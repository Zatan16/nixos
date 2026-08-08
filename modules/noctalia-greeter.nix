{ ...}:

{
  # services.displayManager.sddm = {
  #   enable = true;
  #   wayland.enable = true;
  #   # theme = "noctalia";
  #   theme = "${pkgs.runCommand "noctalia-sddm-theme" {} ''
  #     mkdir -p $out/share/sddm/themes/noctalia
  #     cp -r ${inputs.sddm-noctalia-theme}/* $out/share/sddm/themes/noctalia
  #   ''}/share/sddm/themes/noctalia";
  #   extraPackages = [
  #     # Inline derivation directly in the list (No 'let' block needed)
  #     # (pkgs.runCommand "noctalia-sddm-theme" {} ''
  #     #   mkdir -p $out/share/sddm/themes/noctalia
  #     #   cp -r ${inputs.sddm-noctalia-theme}/* $out/share/sddm/themes/noctalia
  #     # '')
      
  #     pkgs.kdePackages.qt5compat
  #     pkgs.kdePackages.qtsvg
  #     pkgs.kdePackages.qtdeclarative
  #   ];
  # };

  programs.noctalia-greeter = {
    enable = true;

    settings = {
      session = {
        default = "niri-session";
      };

      user = {
        default = "zayaan";
      };
    };
  };
}