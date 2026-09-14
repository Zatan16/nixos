{ ... }:

{
  services.flatpak = {
    enable = true;
    packages = [
      "org.vinegarhq.Sober"
      "com.github.d4nj1.tlpui"
    ];
  };
}
