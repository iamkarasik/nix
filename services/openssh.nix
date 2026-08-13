{username, ...}: {
  services.openssh = {
    enable = true;
    ports = [22];
    settings = {
      PasswordAuthentication = true;
      AllowUsers = [username];
      UseDns = false;
      X11Forwarding = false;
      PermitRootLogin = "no";
    };
  };
}
