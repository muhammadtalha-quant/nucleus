{
  description = "A fully functional starter for NixOS based on Nucleus Architecture that includes a fully integrated experience with the GNOME Desktop Environment.";

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
      # !=== SYSTEM CONFIG ===!
      userName = "DESIRED_USERNAME";
      hostName = "DESIRED_HOSTNAME";
      timeZone = "REGION/CITY";
      hashedUserPassword = "STDOUT OF 'mkpasswd -m yescrypt YOUR_DESIRED_USER_PASSWORD'";
      hashedRootPassword = "STDOUT OF 'mkpasswd -m yescrypt YOUR_DESIRED_ROOT_PASSWORD'";
      stateVersion = "YEAR.RELEASE";

      # !=== USER CONFIG ===!
      realName = "YOUR REAL NAME";

      # !=== DISKO CONFIG ===!
      storageDevice = "/dev/DEVICE";
      swapSize = "8G";

      # !=== ENVIRONMENT CONFIG ===!
      configDirectory = "/etc/nixos/";

      # !=== HOME MANAGER ===!
      hmArgs = {
        inherit realName;
        inherit stateVersion;
        emailAddress = "you@mailbox.com";
        gpgKey = "XXXXXXXXXXXXXXXX";
      };
    in
    {
      diskoConfigurations.${hostName} = import ./modules/common/disko/bare-ext4.nix {
        inherit storageDevice;
        inherit swapSize;
      };
      nixosConfigurations.${hostName} =
        let
          hostHardware = builtins.fromJSON (
            builtins.readFile ./modules/hosts/${hostName}/hardware_report.json
          );
        in
        nixpkgs.lib.nixosSystem {
          inherit (hostHardware) system;
          specialArgs = {
            inherit userName;
            inherit hashedRootPassword;
            inherit hashedUserPassword;
            inherit stateVersion;
            inherit realName;
            inherit hostName;
            inherit timeZone;
            inherit configDirectory;
            inherit storageDevice;
            inherit swapSize;
            inherit hmArgs;
            inherit inputs;
          };
          modules = [
            ./modules/common/nixos-core/core.nix
            ./modules/features/workstation/workstation.nix
            ./modules/hosts/${hostName}/default.nix
            home-manager.nixosModules.home-manager
            ./modules/features/home-manager/decl.nix
            disko.nixosModules.disko
            ./modules/common/disko/bare-ext4.nix
          ];
        };
    };
}
