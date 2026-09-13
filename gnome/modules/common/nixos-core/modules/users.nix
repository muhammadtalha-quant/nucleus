{
  hashedRootPassword,
  lib,
  ...
}:
{
  users = {
    mutableUsers = lib.mkDefault false;
    users.root.hashedPassword = hashedRootPassword;
  };
}
