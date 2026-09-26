{
  pkgs,
  lib,
  config,
  inputs,
  ...
}:

{
  packages = with pkgs; [
    statix
    nixfmt
    treefmt
  ];
  languages.nix = {
    enable = true;
    lsp.package = pkgs.nil;
  };
  scripts = {
    test-minimal.exec = "cd minimal && nix flake check .";
    test-gnome.exec = "cd gnome && nix flake check .";
    test-kde.exec = "cd kde && nix flake check .";
    lint.exec = "statix check";
    format-ci.exec = "treefmt --config-file treefmt.toml --ci";
    format-local.exec = "treefmt --config-file treefmt.toml";
  };
}
