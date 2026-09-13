{
  inputs,
  timeZone,
  stateVersion,
  ...
}:
{
  imports = [
    (inputs.import-tree ./modules)
  ];

  time = { inherit timeZone; };
  nixpkgs.config.allowUnfree = true;
  system = { inherit stateVersion; };
}
