{
  description = "A minimal starter for NixOS based on Nucleus Architecture.";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    import-tree.url = "github:denful/import-tree";
    disko = {
      url = "github:nix-community/disko/latest";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      self,
      nixpkgs,
      home-manager,
      disko,
      ...
    }@inputs:
    let
      hashedRootPassword = "STDOUT OF 'mkpasswd -m yescrypt YOUR_DESIRED_ROOT_PASSWORD'";

      # !=== HOSTS DEFINITION ===!
      hosts = {
        laptop = {
          hostName = "DESIRED_HOSTNAME";
          stateVersion = "YEAR.RELEASE OF THE ISO YOU ARE INSTALLING FROM";
          timeZone = "REGION/CITY";
          disko = {
            storageDevice = "/dev/DEVICE";
            swapSize = "8G";
          };
        };
        # other hosts....
      };

      # !=== USERS DEFINITION ===!
      users = {
        primary = {
          userName = "DESIRED_USERNAME";
          realName = "YOUR REAL NAME";
          hashedUserPassword = "STDOUT OF 'mkpasswd -m yescrypt YOUR_DESIRED_USER_PASSWORD'";
          emailAddress = "you@mailbox.com";
          gpgKey = "XXXXXXXXXXXXXXXX";
        };
        #secondary = {
        # userName = "DESIRED_USERNAME";
        # realName = "YOUR REAL NAME";
        # hashedUserPassword = "STDOUT OF 'mkpasswd -m yescrypt YOUR_DESIRED_USER_PASSWORD'";
        # emailAddress = "you@mailbox.com";
        # gpgKey = "XXXXXXXXXXXXXXXX";
        #};
        #... other users
      };

      # !=== ENVIRONMENT CONFIG ===!
      configDirectory = "/etc/nixos/";

      # !=== HOME MANAGER ===!
      hmArgs = {
        inherit (users.primary) emailAddress; # maybe secondary?
        inherit (users.primary) gpgKey; # maybe secondary?
        # ...other parameters
      };
    in
    {
      diskoConfigurations.${hosts.laptop.hostName} =
        import ./modules/common/disko/bare-ext4.nix hosts.laptop.disko;
      nixosConfigurations.${hosts.laptop.hostName} = nixpkgs.lib.nixosSystem {
        inherit
          (
            (builtins.fromJSON (
              builtins.readFile ./modules/hosts/${hosts.laptop.hostName}/hardware_report.json
            ))
          )
          system
          ;
        specialArgs = {
          inherit hashedRootPassword;
          inherit hmArgs;
          inherit inputs;
          inherit configDirectory;
          inherit (users.primary) userName;
          inherit (users.primary) hashedUserPassword;
          inherit (users.primary) realName;
          # include other users if you want and then add the user to your users.nix
          inherit (hosts.laptop.disko) swapSize;
          inherit (hosts.laptop.disko) storageDevice;
          inherit (hosts.laptop) hostName;
          inherit (hosts.laptop) timeZone;
          inherit (hosts.laptop) stateVersion;
        };
        modules = [
          ./modules/common/nixos-core/core.nix
          ./modules/features/workstation/workstation.nix
          ./modules/hosts/${hosts.laptop.hostName}/default.nix
          home-manager.nixosModules.home-manager
          ./modules/features/home-manager/decl.nix
          disko.nixosModules.disko
          ./modules/common/disko/bare-ext4.nix
        ];
      };
    };
}
