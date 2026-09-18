{ lib, hostName, ... }: {
  networking = {
    inherit hostName;
    firewall = lib.mkDefault {
      enable = true;
      allowedUDPPorts = [ ];
      allowedTCPPorts = [ ];
    };
    networkmanager.enable = true;
  };
}
