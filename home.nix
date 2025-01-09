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

    # Replace Fish with Bash
    bash = {
      enable = true;
      initExtra = ''
        export PATH=/etc/profiles/pes-user/I571313/bin:$PATH
        aerospace &
        sketchybar &
      '';
    };
  };

  # Set Bash as the default shell
  home.sessionVariables.SHELL = "${pkgs.bash}/bin/bash";

  home.file.".config/aerospace/aerospace.toml".source = ./aerospace.toml;
  home.file.".config/sketchybar" = {
    source = lib.fileset.toSource {
      root = ./sketchybar;
      fileset = lib.fileset.unions [
        ./sketchybar
      ];
    };
    recursive = true;
  };
}
