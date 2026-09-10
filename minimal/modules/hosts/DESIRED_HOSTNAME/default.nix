{
  config,
  pkgs,
  lib,
  ...
}:
{
  hardware.facter.reportPath = ./hardware_report.json;
}
