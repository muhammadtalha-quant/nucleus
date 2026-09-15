{ lib, ... }: {
  networking = {
    firewall = lib.mkDefault {
      enable = true;
      allowedUDPPorts = [ ];
      allowedTCPPorts = [ ];
    };
    networkmanager.enable = true;
  };
}
