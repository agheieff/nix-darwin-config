{ pkgs, ... }: {
  # Define the user in the system configuration
  users.users.I571313 = {
    name = "I571313";
    home = "/Users/I571313";  # Ensure this matches the homeDirectory in home.nix
  };

  # System configuration
  environment.systemPackages = [ pkgs.vim ];

  # Necessary for using flakes on this system.
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # The platform the configuration will be used on.
  nixpkgs.hostPlatform = "aarch64-darwin";

  # Used for backwards compatibility
  system.stateVersion = 5;

  # Enable alternative shell support in nix-darwin.
  programs.fish.enable = false;  # Disable Fish
  programs.zsh.enable = true;    # Keep Zsh enabled if needed
  
  environment.systemPath = [
    "/opt/homebrew/bin"
    "/run/current-system/sw/bin"
  ];

  homebrew = {
    enable = true;
    taps = [
      "FelixKratz/formulae"
    ];
    brews = [
      "sketchybar"
    ];
    casks = [ 
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
