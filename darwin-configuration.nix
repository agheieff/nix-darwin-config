{ pkgs, ... }: {
  users.users.I571313 = {
    name = "I571313";
    home = "/Users/I571313";
  };

  environment.systemPackages = [ pkgs.vim ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  nixpkgs.hostPlatform = "aarch64-darwin";

  system.stateVersion = 5;

  programs.fish.enable = false;
  programs.zsh.enable = true;
  
  environment.systemPath = [
    "/opt/homebrew/bin"
    "/run/current-system/sw/bin"
  ];

  homebrew = {
    enable = true;
    taps = [
      "FelixKratz/formulae"
      "nikitabobko/tap"
    ];
    brews = [
      "sketchybar"
      "switchaudio-osx"
    ];
    casks = [
      "aerospace"
      "firefox@developer-edition"
      "microsoft-teams"
      "microsoft-outlook"
      "alacritty"
      "lm-studio"
      "libreoffice"
      "font-dejavu-sans-mono-nerd-font"
      "font-droid-sans-mono-nerd-font"
      "font-jetbrains-mono-nerd-font"
      "font-liberation-nerd-font"
      "font-noto-nerd-font"
      "font-roboto-mono-nerd-font"
      "font-space-mono-nerd-font"
    ];

    onActivation = {
      autoUpdate = true;
      upgrade = true;
      cleanup = "zap";
    };
  };
}
