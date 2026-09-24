{
  gpgKey,
  emailAddress,
  realName,
  ...
}:
{
  programs.git = {
    enable = true;
    signing = {
      key = gpgKey;
      format = "openpgp";
      signByDefault = false;
      signer = "/run/current-system/sw/bin/gpg2";
    };
    settings = {
      init = {
        defaultBranch = "main";
      };
      commit = {
        gpgSign = true;
      };
      tag = {
        gpgSign = true;
      };
      user = {
        name = realName;
        email = emailAddress;
        useConfigOnly = true;
      };
      credential = {
        "https://github.com" = {
          helper = "/run/current-system/sw/bin/gh auth git-credential";
        };
        "https://gist.github.com" = {
          helper = "/run/current-system/sw/bin/gh auth git-credential";
        };
      };
    };
  };
}
