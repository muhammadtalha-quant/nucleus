{
  userName,
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
      signByDefault = true;
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
      http = {
        version = "HTTP/1.1";
        postBuffer = 524288000;
        lowSpeedLimit = 1000;
        lowSpeedTime = 600;
      };
    };
  };
}
