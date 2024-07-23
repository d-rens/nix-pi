{ 
  config, 
  lib, 
  pkgs, 
  inputs,
  ... 
}:
{
  imports = [
      ./hardware-configuration.nix
      ./services
      ./virtualisation.nix
      ./home.nix
  ];

  boot.loader.grub = {
    device = "nodev";
    efiSupport = true;
  };

  networking = {
    hostName = "nixpi";
    networkmanager.enable = true;
  };

  time.timeZone = "Europe/Berlin";

  users = {
    defaultUserShell = pkgs.fish;
    users.pi = {
      description = "pi";
      isNormalUser = true;
      extraGroups = [ 
        "wheel"
      ]; 
      initialPassword = "password";
    };
  };

  environment.systemPackages = with pkgs; [
    borgbackup
    btop
    fish
    git
    neovim
    tmux
    tree
    wget
  ];

  # programs.mtr.enable = true;
  programs = {
    fish.enable = true;
    gnupg.agent = {
      enable = true;
      enableSSHSupport = true;
    };
  };

  nix = {
    package = pkgs.nixFlakes;
    extraOptions = "experimental-features = nix-command flakes";
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 15d";
    };
  };

  services.openssh.enable = true;

  networking.firewall.enable = false;

  system = {
    stateVersion = "unstable";
    autoUpgrade = {
      enable = true;
      channel = "https://nixos.rog/channels/nixos-unstable";
    };
  };
}

