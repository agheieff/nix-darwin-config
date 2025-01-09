{ pkgs, lib, ... }: {
  home = {
    stateVersion = "23.11";
    username = "I571313";
    homeDirectory = "/Users/I571313";
    packages = with pkgs; [
      sketchybar
      aerospace
      alacritty
      ripgrep
      fd
      fzf
    ];
  };

    home.activation = {
    aliasApplications = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
      app_folder=$(echo ~/Applications);
      for app in $(find "$genProfilePath/home-path/Applications" -type l); do
        $DRY_RUN_CMD rm -f $app_folder/$(basename $app)
        $DRY_RUN_CMD osascript -e "tell app \"Finder\"" -e "make new alias file at POSIX file \"$app_folder\" to POSIX file \"$app\"" -e "set name of result to \"$(basename $app)\"" -e "end tell"
      done
    '';
  };

  programs = {
    home-manager.enable = true;
    
    git = {
      enable = true;
      userName = "agheieff";
      userEmail = "agheieff@pm.me";
    };

    fish = {
      enable = true;
      shellInit = ''
        aerospace &
        sketchybar &
      '';
    };
  };

  home.file.".config/aerospace/aerospace.toml".source = ./aerospace.toml;
  home.file.".config/sketchybar" = {
    source = ./sketchybar;
    recursive = true;
  };
}
