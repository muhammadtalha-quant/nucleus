{
  pkgs,
  inputs,
  stateVersion,
  userName,
  ...
}:

{

  imports = [
    (inputs.import-tree ./modules)
  ];
  programs.home-manager.enable = true;
  home = {
    username = userName;
    homeDirectory = "/home/${userName}";
    packages = with pkgs; [
      hello # this is a dummy package, remove it
    ];
    inherit stateVersion;
  };

}
