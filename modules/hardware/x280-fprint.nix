{ config, pkgs, lib, nixos-06cb-009a-fingerprint-sensor, ... }: 
{
  services.open-fprintd.enable = true;
  services.python-validity.enable = true;
}