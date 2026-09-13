{
  description = "NixOS flake for starting out with Nucleus Architecture.";

  outputs = { self }: {

    templates = {

      minimal = {
        path = ./minimal;
        description = "Template that provides building blocks for building your NixOS system based on Nucleus Architecture.";
      };
      gnome = {
        path = ./gnome;
        description = "Template that provides a solid starting point for building your NixOS system with GNOME Desktop Environment based on Nucleus Architecture.";
      };
      kde = {
        path = ./kde;
        description = "Template that provides a solid starting point for building your NixOS system with K Desktop Environment based on Nucleus Architecture.";
      };
      default = self.templates.minimal;
    };
  };
}
