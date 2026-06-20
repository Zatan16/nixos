{ ... }:

{
  # Disable systemd-resolved to prevent port 53 conflicts
  services.resolved.enable = false;

  # Ensure NetworkManager doesn't override DNS settings
  networking.networkmanager.dns = "none";

  services.adguardhome = {
    enable = true;
    openFirewall = false;
    
    # Use NixOS module options for binding (Recommended)
    host = "0.0.0.0";  # Listen on all interfaces
    port = 3000;       # Web UI port
    
    # Internal AdGuard settings (DNS configuration, filters, etc.)
    settings = {
      dns = {
        bind_hosts = [ "0.0.0.0" ]; # DNS listener
        upstream_dns = [
          "https://dns.google/dns-query"
          "https://dns.cloudflare.com/dns-query"
        ];
        bootstrap_dns = [
          "8.8.8.8"
          "1.1.1.1"
        ];
      };
    };
  };

  networking.nameservers = [ "127.0.0.1" ];
}   
