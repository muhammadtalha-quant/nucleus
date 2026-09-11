{ userName, extraSpecialArgs, ... }: {
  home-manager = {
    extraSpecialArgs = extraSpecialArgs // {
      inherit userName;
    };
    useGlobalPkgs = true;
    useUserPackages = true;
    users.${userName} = import ./home.nix;
    backupFileExtension = "backup";
  };
}
