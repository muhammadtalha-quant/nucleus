{
  programs = {
    kdeconnect.enable = true;
    gnupg.agent = {
      settings = {
        default-cache-ttl = 43200;
        max-cache-ttl = 43200;
      };
    };
  };
}
