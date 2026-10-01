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
      # !=== HOSTS DEFINITION ===!
      hosts = {
        laptop = {
          hostName = "DESIRED_HOSTNAME";
          stateVersion = "YEAR.RELEASE OF THE ISO YOU ARE INSTALLING FROM";
          timeZone = "REGION/CITY";
          diskoConfig = {
            storageDevice = "/dev/DEVICE";
            swapSize = "8G";
          };
        };
      };

      # !=== USERS DEFINITION ===!
      users = {
        root.hashedPassword = "STDOUT OF 'mkpasswd -m yescrypt YOUR_DESIRED_ROOT_PASSWORD'";
        primary = {
          userName = "DESIRED_USERNAME";
          realName = "YOUR REAL NAME";
          hashedPassword = "STDOUT OF 'mkpasswd -m yescrypt YOUR_DESIRED_USER_PASSWORD'";
          emailAddress = "you@mailbox.com";
          gpgKey = "XXXXXXXXXXXXXXXX";
        };
      };

      # !=== ENVIRONMENT CONFIG ===!
      configDirectory = "/etc/nixos/";

    in
    {
      diskoConfigurations.${hosts.laptop.hostName} =
        import ./modules/common/disko/bare-ext4.nix hosts.laptop;
      nixosConfigurations = {
        ${hosts.laptop.hostName} =
          let
            currentHost = hosts.laptop;
          in
          nixpkgs.lib.nixosSystem {
            inherit
              (
                (builtins.fromJSON (builtins.readFile ./modules/hosts/${currentHost.hostName}/hardware_report.json))
              )
              system
              ;
            specialArgs = {
              inherit inputs;
              inherit configDirectory;
              inherit users;
              inherit currentHost;
              inherit (currentHost) diskoConfig;
            };
            modules = [
              ./modules/common/nixos-core/core.nix
              ./modules/features/workstation/workstation.nix
              ./modules/hosts/${currentHost.hostName}/default.nix
              home-manager.nixosModules.home-manager
              ./modules/features/home-manager/decl.nix
              disko.nixosModules.disko
              ./modules/common/disko/bare-ext4.nix
            ];
          };
      };
    };
}
