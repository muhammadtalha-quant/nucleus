{
  den.schema.host = { lib, host, ... }: {
    options = {
      stateVersion = lib.mkOption {
        type = lib.types.str;
        default = "";
      };
      timeZone = lib.mkOption {
        type = lib.types.str;
        default = "";
      };
      flakePath = lib.mkOption {
        type = lib.types.str;
        default = "/etc/nixos";
      };
      disko = lib.mkOption {
        type = lib.types.submodule {
          options = {
            device = lib.mkOption {
              type = lib.types.str;
              default = "";
            };
            swapSize = lib.mkOption {
              type = lib.types.str;
              default = "";
            };
          };
        };
      };
    };
  };
}
