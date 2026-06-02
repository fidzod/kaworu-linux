{ config, pkgs, ... }:

{
  programs.bash = {
    enable = true;

    shellAliases = {
      rebuild = "sudo nixos-rebuild switch --flake /etc/nixos#thinkpad";
      vi = "nvim";
      ls = "eza -1";
      cat = "bat -pp";
    };

    initExtra = ''
      fastfetch
    '';
  };

  programs.oh-my-posh = {
    enable = true;
    useTheme = "tokyo";
  };
}
