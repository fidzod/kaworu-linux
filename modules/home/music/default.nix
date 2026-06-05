{ pkgs, config, ... }:

{
  home.packages = with pkgs; [ mpc ];

  services.mpd = {
    enable = true;
    musicDirectory = /home/fidzod/music;

    extraConfig = ''
      audio_output {
        type "pipewire"
        name "PipeWire Output"
      }
    '';
  };

  programs.rmpc = {
    enable = true;
    config = builtins.readFile ./rmpc-config.ron;
  };

  home.file.".config/rmpc/themes/rmpctheme.ron".text =
    builtins.readFile ./rmpc-theme.ron;
}
