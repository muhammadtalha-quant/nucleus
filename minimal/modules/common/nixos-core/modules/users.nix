{
  users,
  lib,
  ...
}:
{
  users = {
    mutableUsers = lib.mkDefault false;
    users.root = { inherit (users.root) hashedPassword; };
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
