{ pkgs, inputs, ...}:

{
  home.packages = with pkgs; [
    (vscode.override {
        commandLineArgs = "--password-store=gnome-libsecret";
    })

    nixd
    nixfmt
  ];

  nix.nixPath = [ "nixpkgs=${inputs.nixpkgs}" ];
}