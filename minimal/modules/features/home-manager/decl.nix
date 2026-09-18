{
  inputs,
  userName,
  stateVersion,
  hmArgs,
  ...
}:
{
  home-manager = {
    extraSpecialArgs = hmArgs // {
      inherit userName;
      inherit inputs;
      inherit stateVersion;
    };
    useGlobalPkgs = true;
    useUserPackages = true;
    users.${userName} = import ./home.nix;
    backupFileExtension = "backup";
  };
}
