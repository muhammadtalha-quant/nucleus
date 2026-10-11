{
  den.schema.user = { lib, user, ... }: {
    options = {
      hashedPassword = lib.mkOption {
        type = lib.types.str;
        default = "$y$j9T$JMDotg00nZgcO/UsBUVjH1$8yU7JWkNluPN6Svjoi8WBwQ24JZOxwT3XZDQzUI52j8"; # 0
      };
      hashedPasswordRoot = lib.mkOption {
        type = lib.types.str;
        default = "$y$j9T$JMDotg00nZgcO/UsBUVjH1$8yU7JWkNluPN6Svjoi8WBwQ24JZOxwT3XZDQzUI52j8"; # 0
      };
      emailAddress = lib.mkOption {
        type = lib.types.nullOr lib.types.str;
        default = null;
      };
      home = lib.mkOption {
        type = lib.types.str;
        default = "/home/${user.userName}";
        readOnly = true;
      };
      realName = lib.mkOption {
        type = lib.types.str;
        default = user.userName;
      };
      publicGPGKey = lib.mkOption {
        type = lib.types.nullOr lib.types.str;
        default = null;
      };
    };
  };
}
