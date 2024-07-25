{
  config,
  pkgs,
  ...
}:
{
  environment.systemPackages = with pkgs; [
    podman
    podman-tui
    podman-compose

    docui
    oxker
  ];

  virtualisation = {
    podman = {
      enable = true;
      #dockerSocket.enable = true;
    };
    docker = {
      enable = true;
      package = pkgs.docker_27;
      enableOnBoot = true;
    };
  };
}
