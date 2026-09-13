{ pkgs, configDirectory, ... }:
{
  programs = {
    kdeconnect.enable = true;
    nh.flake = configDirectory;
    gnupg.agent = {
      pinentryPackage = pkgs.pinentry-gnome3;
      settings = {
        default-cache-ttl = 43200;
        max-cache-ttl = 43200;
      };
    };
  };
}
