{
  hashedRootPassword,
  users,
  lib,
  ...
}:
{
  users = {
    mutableUsers = lib.mkDefault false;
    users.root.hashedPassword = hashedRootPassword;
    users = {
      ${users.primary.userName} = {
        isNormalUser = true;
        description = users.primary.realName;
        extraGroups = [
          "networkmanager"
          "wheel"
        ];
        inherit (users.primary) hashedPassword;
      };
    };
  };
}
