{
  hashedRootPassword,
  ...
}:
{
  users = {
    mutableUsers = false;
    users.root.hashedPassword = hashedRootPassword;
  };
}
