{ pkgs, ... }: {
  home = {
    stateVersion = "23.11";
    username = "I571313";
    homeDirectory = "/Users/I571313";  # Ensure this is a valid path
    packages = with pkgs; [
      ripgrep
      fd
      fzf
    ];
  };

  programs = {
    home-manager.enable = true;
    
    git = {
      enable = true;
      userName = "Your Name";
      userEmail = "your.email@example.com";
    };

    fish = {
      enable = true;
    };
  };
}
