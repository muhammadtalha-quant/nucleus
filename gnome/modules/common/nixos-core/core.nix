{
  inputs,
  pkgs,
  configDirectory,
  ...
}:
{
  imports = [
    (inputs.import-tree ./modules)
  ];

  services.dbus.enable = true;
  services.envfs.enable = true;

  programs = {
    gnupg = {
      agent.enable = true;
      agent.enableSSHSupport = true;
    };
    fish.enable = true;
  };
  environment = {
    sessionVariables = {
      LANG = "en_US.UTF-8";
      CONFIG = configDirectory;
    };
    systemPackages = with pkgs; [
      nix-output-monitor
      ripgrep
      _7zz
      zip
      eza
      bat
      unzip
      git
      gh
      neovim
      devenv
      microfetch
    ];
  };
}
