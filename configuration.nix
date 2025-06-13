# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

# NixOS-WSL specific options are documented on the NixOS-WSL repository:
# https://github.com/nix-community/NixOS-WSL
{ config, lib, pkgs, ... }:

{
#  imports = [ <nixos-wsl/modules> ];

  wsl.enable = true;
  wsl.defaultUser = "haiminh256";

  networking.hostName = "dell-vostro";
  networking.networkmanager.enable = true;
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  time.timeZone = "Asia/Ho_Chi_Minh";

  users.users.haiminh256 = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
    shell = pkgs.bash;
  };

  environment.systemPackages = with pkgs; [
    tree
    bash
    btop
    bat
    neofetch
    neovim
    git
  ];
  system.stateVersion = "24.11";
}

