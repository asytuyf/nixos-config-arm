{ config, pkgs, ... }:

{
  programs.git = {
    enable = true;
    userName = "Asytuyf";
    userEmail = "nabaoui21@gmail.com";
    extraConfig = {
      init.defaultBranch = "main";
      credential.helper = "/run/current-system/sw/bin/gh auth git-credential";
      safe.directory = "/etc/nixos";
    };
  };
}
