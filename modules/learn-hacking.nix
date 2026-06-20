{ pkgs, ... }:

{
    environment.systemPackages = with pkgs; [
        nmap
        netcat-gnu
        tcpdump
        wireshark
    ];
}
