{ configDirectory, ... }:
{
  programs = {
    kdeconnect.enable = true;
    nh.flake = configDirectory;
    gnupg.agent = {
      settings = {
        default-cache-ttl = 43200;
        max-cache-ttl = 43200;
      };
    };
  };
}
