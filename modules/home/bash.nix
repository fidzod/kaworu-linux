{ config, pkgs, ... }:

{
  programs.bash = {
    enable = true;

    shellAliases = {
      rebuild = "sudo nixos-rebuild switch --flake /etc/nixos#vm";
      vi = "nvim";
    };

    initExtra = ''
      PS1='\[\e[32m\]\u\[\e[0m\] \[\e[31m\]\w\[\e[0m\] \[\e[33m\]λ\[\e[m\] '
      fastfetch
    '';
  };
}
