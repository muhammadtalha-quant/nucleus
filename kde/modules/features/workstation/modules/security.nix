{
  security = {
    rtkit.enable = true;
    pam.services.sddm = {
      kwallet.enable = true;
      fprintAuth = true;
    };
  };
}
