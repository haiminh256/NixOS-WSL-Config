{ config, pkgs, ... }:

{
  home.username = "haiminh256";
  home.homeDirectory = "/home/haiminh256";

  programs.home-manager.enable = true;

  programs.bash = {
    enable = true;
    shellAliases = {
      nrs = "sudo nixos-rebuild switch --flake /etc/nixos#haiminh256";
      ncl = "sudo nix-collect-garbage -d";
      nix-install = "sudo nix profile install";
      nix-remove = "sudo nix profile remove";
      nix-clean = "sudo nix store gc";
      nix-list = "sudo nix profile list";
    };
    initExtra = ''
	PS1='\[\e[1;32m\]\u@\h \[\e[1;34m\]\w\[\e[0m\] \$ '
    '';
  };
  programs.neovim.enable = true;
  programs.git.enable = true;

  home.packages = with pkgs; [
    htop
    unzip
    python3
    nodejs
    bun
    gcc
    gnumake
    cmake
  ];

  home.stateVersion = "24.11";
}

