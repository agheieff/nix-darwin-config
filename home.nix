{ pkgs, lib, ... }: {
  home = {
    stateVersion = "23.11";
    username = "I571313";
    homeDirectory = "/Users/I571313";
    sessionPath = [
      "/opt/homebrew/bin"
      "/etc/profiles/per-user/I571313/bin"
    ];
    packages = with pkgs; [
      # Nerd Fonts
      nerd-fonts.hack
      nerd-fonts.space-mono
      lua5_4
      neofetch

      neovim
      gimp
      aerospace
      alacritty
      ripgrep
      fd
      fzf

      gcc
      cmake
    ];
  };

  fonts = {
    fontconfig.enable = true;
  };

  programs = {
    home-manager.enable = true;
    
    git = {
      enable = true;
      userName = "agheieff";
      userEmail = "agheieff@pm.me";
    };

    bash = {
      enable = true;
      initExtra = ''
        export PATH=/etc/profiles/per-user/I571313/bin:$PATH
        aerospace &
        sketchybar &
      '';
    };
  };

  # Set Bash as the default shell
  home.sessionVariables.SHELL = "${pkgs.bash}/bin/bash";

  home.file.".config/aerospace/aerospace.toml".source = ./aerospace.toml;

  home.file.".config/sketchybar" = {
    source = pkgs.runCommand "sketchybar-config" {} ''
      mkdir -p $out
      cp -r ${./sketchybar}/* $out/

      # Ensure the directories exist before running chmod
      if [[ -d $out/bridge/menus/bin ]]; then
        chmod -R +x $out/bridge/menus/bin
      fi

      if [[ -d $out/bridge/network_load/bin ]]; then
        chmod -R +x $out/bridge/network_load/bin
      fi
    '';
    recursive = true;
  };
}
