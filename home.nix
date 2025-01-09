{ pkgs, ... }: {
  home = {
    stateVersion = "23.11";
    username = "I571313";
    homeDirectory = "/Users/I571313";
    packages = with pkgs; [
      alacritty
      ripgrep
      fd
      fzf
    ];
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
    };
  };
}
