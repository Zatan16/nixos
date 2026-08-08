{ pkgs, ...}:

{
  environment.systemPackages = with pkgs; [
    (vscode.override {
        commandLineArgs = "--password-store=gnome-libsecret";
    })

    nixd
    nixfmt
  ];
}