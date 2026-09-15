{
  inputs,
  userName,
  hmArgs,
  ...
}:
{
  home-manager = {
    extraSpecialArgs = hmArgs // {
      inherit userName;
      inherit inputs;
    };
    useGlobalPkgs = true;
    useUserPackages = true;
    users.${userName} = import ./home.nix;
    backupFileExtension = "backup";
  };
}
