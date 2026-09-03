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
    marksman
    markdownlint-cli2
    markdown-toc
  ];
  languages.nix = {
    enable = true;
    lsp.package = pkgs.nil;
  };
}
