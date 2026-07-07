{ ... }:

{
  services.ollama = {
    enable = true;
    loadModels = [ "nemotron-3-nano:4b" "gemma4:e2b" ];
    syncModels = true;
    host = "0.0.0.0";
  };

  # services.open-webui = {
  #   enable = true;
  #   port = 8080;
  #   host = "0.0.0.0";  # or "0.0.0.0" if you want it reachable from other devices on your LAN
  #   environment = {
  #     OLLAMA_API_BASE_URL = "http://127.0.0.1:11434/api";
  #     WEBUI_AUTH = "False";  # skip login screen; set true if you want accounts/auth
  #   };
  # };

  virtualisation.podman.enable = true;

  virtualisation.oci-containers.backend = "podman";
  virtualisation.oci-containers.containers.open-webui = {
    image = "ghcr.io/open-webui/open-webui:main";
    ports = [ "8080:8080" ];
    environment = {
      OLLAMA_BASE_URL = "http://host.containers.internal:11434";
      WEBUI_AUTH = "False";
    };
    extraOptions = [ "--add-host=host.containers.internal:host-gateway" ];
    volumes = [ "open-webui:/app/backend/data" ];
  };

  networking.firewall.allowedTCPPorts = [ 8080 ];
  networking.firewall.interfaces."podman0".allowedTCPPorts = [ 11434 ];
}