{
  inputs,
  timeZone,
  userName,
  stateVersion,
  ...
}:
{
  imports = [
    (inputs.import-tree ./modules)
  ];

  nix.settings.trusted-users = [
    "${userName}"
  ];
  time = { inherit timeZone; };
  nixpkgs.config.allowUnfree = true;
  system = { inherit stateVersion; };
}
