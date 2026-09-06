{
  programs.nh = {
    enable = true;
    clean = {
      enable = true;
      dates = "Mon *-*-* 09:00:00";
      extraArgs = "--keep 3 --keep-since 5d";
    };
  };
}
