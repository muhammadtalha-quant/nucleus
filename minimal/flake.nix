{
  description = "A modular multi host flake that manages one complete single user NixOS system at a time, using the nucleus architecture.";

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
      userName = "muhammadtalha";
      hostName = "hp-probook-430g2";
      timeZone = "Asia/Karachi";
      locale = "en_US.UTF-8";
      hashedUserPassword = "$y$j9T$T/fyOwJSnwDN5vhbYvxOU0$xWmn12BoAIyDVChelEt7LyhGHQTMlJjd/5OEuy6Ud65";
      hashedRootPassword = "$y$j9T$CXXX951qyBSRGHfHxZ8E01$ooy/jGSGAqWqdNQ0WA9pMbjibDGYoA2jsmDU8GJhbv2";
      stateVersion = "26.05";

      # !=== FLAKE CONFIG ===!
      system = "x86_64-linux";

      # !=== USER CONFIG ===!
      realName = "Muhammad Talha";
      emailAddress = "muhammadtalha.quant@gmail.com";
      gpgKey = "33DF23031DE1A83C"; # public key

      # !=== DISKO CONFIG ===!
      storageDevice = "/dev/sda";
      swapSize = "4G"; # size of swap partition

      # !=== ENVIRONMENT CONFIG ===!
      configDirectory = "/etc/nixos/minimal/";
    in
    {
      diskoConfigurations.${hostName} = import ./modules/common/disko/laptop.nix {
        inherit storageDevice;
        inherit swapSize;
      };
      nixosConfigurations.${hostName} = nixpkgs.lib.nixosSystem {
        inherit system;
        specialArgs = {
          inherit userName;
          inherit hashedRootPassword;
          inherit hashedUserPassword;
          inherit stateVersion;
          inherit realName; # for user desc
          inherit hostName;
          inherit timeZone;
          inherit configDirectory;
          inherit storageDevice;
          inherit locale;
          inherit swapSize;
          inherit devices;
          inherit folders;
          inherit inputs;
        };
        modules = [
          ./modules/common/nixos-core/core.nix
          ./modules/features/workstation/workstation.nix
          ./modules/hosts/${hostName}/default.nix
          home-manager.nixosModules.home-manager
          {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              users.${userName} = import ./modules/features/home-manager/home.nix;
              backupFileExtension = "backup";
              extraSpecialArgs = {
                inherit inputs;
                inherit userName;
                inherit stylix;
                inherit realName;
                inherit stateVersion;
                inherit gpgKey;
                inherit lazyvim;
                inherit emailAddress;
              };
            };
          }
          disko.nixosModules.disko
          ./modules/common/disko/laptop.nix
        ];
      };
    };
}
