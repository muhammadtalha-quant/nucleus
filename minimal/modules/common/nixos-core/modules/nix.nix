{
  nix = {
    settings = {
      experimental-features = [
        "nix-command"
        "flakes"
      ];
      trusted-users = [
        "root"
        "@wheel"
      ];
    };
    optimise = {
      automatic = true;
      dates = [ "09:00:00" ];
    };
  };
}
