{
  security = {
    rtkit.enable = true;
    pam.services.gdm = {
      enableGnomeKeyring = true;
      fprintAuth = true;
    };
  };
}
