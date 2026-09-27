{ ... }:

{
  virtualisation.libvirtd.enable = true;
  boot.kernelModules = [ "kvm-intel" ];
  virtualisation.virtualbox.host.enable = true;
  virtualisation.vmware.host.enable = true;
}