{
  pkgs,
  userName,
  realName,
  hashedUserPassword,
  ...
}:
{
  users = {
    users.${userName} = {
      isNormalUser = true;
      description = realName;
      extraGroups = [
        "networkmanager"
        "wheel"
      ];
      shell = pkgs.fish;
      hashedPassword = hashedUserPassword;
    };
  };
}
