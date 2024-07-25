{
  config,
  pkgs,
  ...
}:
{
  #environment.systemPackages = with pkgs; [
  #  borgbackup
  #];

  services.borgbackup.repos.t470 = {
    user = "borg";
    path = "/mnt/data/borg/t470";
    authorizedKeys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIOS9NK7X0K5mgoSTlAB+v8QlIDynJDJCPo6QO3IamnFu da@nixos-t"
    ];
  };
}
