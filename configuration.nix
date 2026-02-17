# Abdo NixOS Configuration (ARM Mac VM)
# Main configuration file - imports all modules

{ config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ./modules/desktop.nix
    # ./modules/bspwm-packages.nix  # Disabled: not using bspwm on ARM
    ./modules/hyprland.nix
    ./modules/development.nix
    ./modules/packages.nix
    ./modules/shell.nix
    # ./modules/secrets.nix  # Removed: not using sops on ARM
  ];

  home-manager.users.abdo = import ./home/abdo.nix;

  # === CORE SYSTEM CONFIGURATION ===

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nixos";
  networking.networkmanager.enable = true;

  time.timeZone = "Europe/Brussels";
  i18n.defaultLocale = "en_US.UTF-8";

  users.users.abdo = {
    isNormalUser = true;
    description = "Abdo";
    extraGroups = [ "networkmanager" "wheel" ];
  };

  security.sudo.extraRules = [{
    users = [ "abdo" ];
    commands = [{
      command = "ALL";
      options = [ "NOPASSWD" ];
    }];
  }];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  nix.gc.automatic = true;
  nix.gc.dates = "daily";
  nix.gc.options = "--delete-older-than 10d";
  nix.settings.auto-optimise-store = true;

  system.autoUpgrade = {
    enable = true;
    dates = "weekly";
    flake = "/etc/nixos";
    flags = [ "--update-input" "nixpkgs" ];
  };

  system.stateVersion = "25.11";
}
