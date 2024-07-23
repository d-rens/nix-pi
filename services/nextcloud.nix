{
  config,
  pkgs,
  ...
}:
{
  environment.etc = {
    "nextcloud-admin-pass".text = "password";
    "nextcloud-user-pass".text = "password";
  };

  services.nextcloud = {
     enable = true;
     package = pkgs.nextcloud29;

     autoUpdateApps.enable = true;
     configureRedis = true;
     database.createLocally = true;
     datadir = "/mnt/data/nextcloud";
     hostName = "nixpi.local";
     maxUploadSize = "10G";
     
     config = {
       adminpassFile = "/etc/nextcloud-admin-pass";
       adminuser = "root";
     };
     settings = {
       trustedDomains = [
         "nixpi.local"
         "127.0.0.1"
       ];
       ensureUsers = {
         daniel = {
           email = "daniel@d-rens.xyz";
           passwordFile = "/etc/nextcloud-user-pass";
         };
       };
     };
   };
}
