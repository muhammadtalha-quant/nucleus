{ extraSpecialArgs }:
{
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    users.${extraSpecialArgs.userName} = import ./home.nix;
    backupFileExtension = "backup";
    inherit extraSpecialArgs;
  };
}
