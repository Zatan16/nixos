{ ...}:

{
  programs.noctalia-greeter = {
    enable = false;

    settings = {
      session = {
        default = "niri-session";
      };

      user = {
        default = "zayaan";
      };
    };
  };

  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = "niri-session";
        user = "zayaan";
      };
    };
  };

  systemd.services.greetd = {
    after = [
      "systemd-user-sessions.service"
      "plymouth-quit-wait.service"
      "getty@tty1.service"
    ];
    serviceConfig = {
      Type = "idle";
      StandardInput = "tty";
      StandardOutput = "tty";
      TTYPath = "/dev/tty1";
      TTYReset = true;
      TTYHangup = true;
    };
  };
}
