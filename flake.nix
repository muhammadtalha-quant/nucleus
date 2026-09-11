{
  description = "NixOS flake for starting out with nucleus architecture.";

  outputs = { self }: {

    templates = {

      minimal = {
        path = ./minimal;
        description = "Template that provides building blocks for building your NixOS system.";
      };
      default = self.templates.minimal;
    };
  };
}
