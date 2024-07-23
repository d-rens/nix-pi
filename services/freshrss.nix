{
  config,
  pkgs,
  ...
}:
{
  environment.etc = {
    "freshrss-password".text = "password";
  };

  #is at port 80
  # try reverse proxy
  services.freshrss = {
    enable = true;
    package = pkgs.freshrss;

    baseUrl = "http://localhost";
    dataDir = "/mnt/data/freshrss";

    database = {
      user = "freshrss";
      passFile = "/etc/freshrss-password";
      type = "sqlite";
    };

    defaultUser = "freshrss";
    authType = "none";
    user = "freshrss";
    passwordFile = "/etc/freshrss-password";
  };
}
