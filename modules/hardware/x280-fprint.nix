{ x280-fprint, ... }: 
{
  services.open-fprintd.enable = true;
  services.python-validity.enable = true;

  security.pam.services.sudo.text = ''
  # Account management.
  account required pam_unix.so
  
  # Authentication management.
  auth sufficient pam_unix.so   likeauth try_first_pass nullok
  auth sufficient ${x280-fprint.localPackages.fprintd-clients}/lib/security/pam_fprintd.so
  auth required pam_deny.so
  
  # Password management.
  password sufficient pam_unix.so nullok sha512
  
  # Session management.
  session required pam_env.so conffile=/etc/pam/environment readenv=0
  session required pam_unix.so
'';
}