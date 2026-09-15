{
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
      hashedPassword = hashedUserPassword;
    };
  };
}
