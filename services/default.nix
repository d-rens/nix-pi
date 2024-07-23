{
  config,
  pkgs,
  ...
}:
{
  imports = [
    ./nextcloud.nix
    ./freshrss.nix
  ];

  services = {
    # probably only works on unstable
    # immich = {
    #   enable = true;
    # };
    
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
