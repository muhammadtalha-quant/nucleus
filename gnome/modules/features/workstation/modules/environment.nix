{
  pkgs,
  configDirectory,
  ...
}:
{
  environment = {
    sessionVariables = {
      EDITOR = "vim";
      VISUAL = "nano";
      QT_QPA_PLATFORM = "wayland;xcb";
      NIXOS_OZONE_WL = "1";
      FLAKE_PATH = configDirectory;
    };
    systemPackages = with pkgs; [ vim ];
  };

}
