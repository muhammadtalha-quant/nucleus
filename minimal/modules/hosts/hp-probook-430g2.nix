{ diskoConfigurations, ... }: {
  den.aspects.hp-probook-430g2 = { host, ... }: {
    includes = [
      diskoConfigurations.ext4-simple
    ];
    nixos =
      { pkgs, ... }:
      {
        hardware = {
          graphics = {
            enable = true;
            extraPackages = with pkgs; [
              intel-media-driver
            ];
          };
          bluetooth.enable = true;
          bluetooth.powerOnBoot = true;
        };
        hardware.facter.reportPath = ./hp-probook-430g2.json;
      };
  };
}
