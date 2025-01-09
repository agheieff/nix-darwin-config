{ pkgs, ... }: {
  # System configuration
  environment.systemPackages = [ pkgs.vim ];

  # Necessary for using flakes on this system.
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # The platform the configuration will be used on.
  nixpkgs.hostPlatform = "aarch64-darwin";

  # Used for backwards compatibility
  system.stateVersion = 5;

  # Enable alternative shell support in nix-darwin.
  programs.fish.enable = true;
  programs.zsh.enable = true;
}
