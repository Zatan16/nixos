{ ...}:

{
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