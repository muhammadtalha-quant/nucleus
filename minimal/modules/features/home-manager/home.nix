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
    pointerCursor.enable = true;
    homeDirectory = "/home/${userName}";
    packages = with pkgs; [
      hello
    ];
    inherit stateVersion;
  };

}
