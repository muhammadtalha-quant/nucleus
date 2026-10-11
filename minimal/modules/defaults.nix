{ lib, den, ... }: {
  den = {
    default = {
      # use the hostname as defined using the den.hosts entity.
      # also automatically define user when found inside host entity object.
      includes = [
        den.batteries.hostname
        den.batteries.define-user
      ];

      # Forward host.stateVersion to homeManager and nixosSystem.
      nixos = { host, ... }: {
        system.stateVersion = host.stateVersion;
      };
      homeManager = { host, ... }: {
        home.stateVersion = host.stateVersion;
      };
    };

    # enable home manager for all users by default.
    schema.user.classes = lib.mkDefault [ "homeManager" ];
    schema.host.includes = [ den.aspects.nixos-core ];
  };
}
