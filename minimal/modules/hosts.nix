{
  den.hosts = {
    x86_64-linux.linux-pc = {
      stateVersion = "26.05"; # change it per host
      timeZone = "REGION/CIYT"; # change it as well.
      disko = {
        device = "/dev/DEVICE"; # DEVICE is a place holder and represents your target device from lsblk output.
        swapSize = "XG"; # X is place holder and represents a number
      };
      users = {
        linus = {
          # see schemas/user-schema.nix and set the correct options for your user.
          # you can add new options as well.
        };
      };
    };
  };
}
