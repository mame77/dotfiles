
{ config, lib, pkgs, ... }:

{
  imports = [ ./hardware-configuration.nix ];

  # core
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  networking.hostName = "mame";
  networking.networkmanager.enable = true;
  time.timeZone = "Asia/Tokyo";
  i18n.defaultLocale = "en_US.UTF-8";

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # user
  users.users.mame = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" "video" "audio" ];
  initialPassword = "mame";
  };

  # niri
  programs.niri.package = pkgs.niri-unstable;
  programs.niri.enable = true;

  # package
  environment.systemPackages = with pkgs; [
    vim
    neovim
    git
    ghostty
    fuzzel
    waybar
    chromium
  ];

  # font
  fonts.packages = with pkgs; [
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-emoji
  ];

  # graphic
  hardware.graphics.enable = true;

  #system
  system.stateVersion = "25.05";
}

