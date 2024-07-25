{
  config,
  pkgs,
  ...
}:
{
  imports = [
    ./docker/immich.nix
    ./docker/stirling-pdf.nix
  ];

  home = {
    username = "pi";
    homeDirectory = "/home/pi";
    stateVersion = "24.05";
  };

  home.packages = with pkgs; [
    pfetch
    zip
  ];

  programs = {
    home-manager.enable = true;
  };
}
