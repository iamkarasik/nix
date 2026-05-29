{
  services.openssh = {
    enable = true;
    ports = [22];
    settings = {
      PasswordAuthentication = true;
      AllowUsers = ["root"];
      UseDns = false;
      X11Forwarding = false;
      PermitRootLogin = "yes";
    };
  };
}
