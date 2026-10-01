{
  inputs,
  currentHost,
  ...
}:
{
  imports = [
    (inputs.import-tree ./modules)
  ];

  time = { inherit (currentHost) timeZone; };
  nixpkgs.config.allowUnfree = true;
  system = { inherit (currentHost) stateVersion; };
}
