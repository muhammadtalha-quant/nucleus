{ pkgs, lib, config, inputs, ... }:

{
  languages.nix = {
    enable = true;
    lsp.package = pkgs.nil;
  };
}
