{ config, pkgs, ... }:

{
  home.username = "alfred";
  home.homeDirectory = "/home/alfred";
  home.stateVersion = "25.05";
  programs.git.enable = true;
  programs.bash = {
    enable = true;
    shellAliases = {
      testaliases = "echo test";
    };
  };
}