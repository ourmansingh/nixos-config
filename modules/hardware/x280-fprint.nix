{ ... }: 
{
  #https://github.com/ahbnr/nixos-06cb-009a-fingerprint-sensor
  services.open-fprintd.enable = true;
  services.python-validity.enable = true;
  
}