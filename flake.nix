{
  description = "NixOS flake for starting out with nucleus architecture.";

  outputs = { self }: {

    templates = {

      default = {
        path = ./default;
        description = "Flake Template Directory";
      };

    };

    defaultTemplate = self.templates.default;

  };
}
