{ den, ... }: {
  den.aspects.linus = { user, ... }: {
    includes = [
      # den.batteries.primary-user --> gives him sudo rights
      (den.batteries.user-shell "bash")
    ];
    user.hashedPassword = user.hashedPassword;

    # user specific settings that will be forwarded to any host that user is included.
    provides.to-hosts.nixos = { pkgs, ... }: { };
  };
}
