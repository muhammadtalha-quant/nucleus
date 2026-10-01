{
  inputs,
  currentHost,
  users,
  ...
}:
{
  home-manager = {
    extraSpecialArgs = {
      inherit inputs;
      inherit (currentHost) stateVersion;
    };
    useGlobalPkgs = true;
    useUserPackages = true;
    users.${users.primary.userName} = import ./home.nix;
    backupFileExtension = "backup";
  };
}
