{ configDirectory, ... }:
{
  programs = {
    localsend.enable = true;
    seahorse.enable = true;
    nh.flake = configDirectory;
    gnupg.agent = {
      settings = {
        default-cache-ttl = 43200;
        max-cache-ttl = 43200;
      };
    };
  };
}
