{
  config,
  pkgs,
  ...
}:
{
  home.username = "pi";
  home.homeDirectory = "/home/pi";

  home.packages = with pkgs; [
    pfetch
    zip
  ];

  home.stateVersion = "24.05";

  programs = {
    home-manager.enable = true;
  };
}
