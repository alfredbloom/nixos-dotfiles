{ config, lib, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
    ];

  environment.systemPackages = with pkgs; [
    vim
    wget
    waybar
    kitty
    firefox
    git
  ];

  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };


  users.users.alfred = {
    isNormalUser = true;
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
      tree
    ];
  };


  time.timeZone = "Europe/Copenhagen";
# console.keymap = "no";
  services.xserver.xkb = {
    layout = "no";
    variant = "";
  };
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  services.getty.autologinUser = "alfred";

  networking.hostName = "nixos";
  networking.networkmanager.enable = true;


  services.xserver.enable=true;
  services.displayManager.sddm.enable=true;
  i18n.defaultLocale = "en_US.UTF-8";

  nixpkgs.config.allowUnfree = true;
  programs.firefox.enable = true;
  
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  system.stateVersion = "25.05";

}