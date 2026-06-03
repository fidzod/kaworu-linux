{ config, pkgs, lib, ... }:

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
      zpdf() { zathura "$@" &>/dev/null & }
    '';
  };

  programs.starship = {
    enable = true;
    settings = {
      add_newline = false;

      format = lib.concatStrings
        [
          "$username"
          "$hostname"
          "$directory"
          "$git_branch"
          "$\{custom.git_dirty}"
          "$character"
        ];

      username = {
        format = "[$user @]($style) ";
        style_user = "red";
        show_always = true;
      };
      
      hostname = {
        format = "[$hostname in]($style) ";
        style = "red";
        ssh_only = false;
      };
      
      directory = {
        style = "green";
      };
      
      git_branch = {
        format = "[$symbol $branch]($style) ";
        symbol = "";
        style = "green";
      };
      
      git_status.disabled = true;
      
      custom.git_dirty = {
        command = ''git diff-index --quiet HEAD -- 2>/dev/null && echo "✓" || echo "✗"'';
        when = "git rev-parse --is-inside-work-tree 2>/dev/null";
        format = "[$output]($style) ";
        style = "green";
      };
      
      character = {
        success_symbol = "[\\$](white)";
        error_symbol = "[\\$](red)";
      };
    };
  };
}
