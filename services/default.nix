{
  config,
  pkgs,
  ...
}:
{
  imports = [
    ./nextcloud.nix
    ./freshrss.nix
    #./immich.nix
  ];

  services = {
    avahi = {
      enable = true;
      nssmdns = true;
      publish = {
        enable = true;
	addresses = true;
	domain = true;
	hinfo = true;
      };
    };

    resolved = {
      enable = true;
    };
  };
}
