{ config, pkgs, ... }:

{
  programs.git = {
    enable = true;
    settings = {
      user = {
        name = "Asytuyf";
        email = "nabaoui21@gmail.com";
      };
      init = {
        defaultBranch = "main";
      };
      credential = {
        helper = "!gh auth git-credential";
      };
      safe = {
        directory = "/etc/nixos";
      };
    };
  };
}
