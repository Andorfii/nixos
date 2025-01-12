{ config, pkgs, ... }:
let
  home-manager = builtins.fetchTarball "https://github.com/nix-community/home-manager/archive/release-24.11.tar.gz";
in
{
  imports = [
    (import "${home-manager}/nixos")
  ];

  home-manager.users.eviltrtl = {
    /* The home.stateVersion option does not have a default and must be set */
    home.stateVersion = "24.11";

    programs.fish.enable = true;

    /* Here goes the rest of your home-manager config, e.g. home.packages = [ pkgs.foo ]; */
    home.packages = with pkgs.gnomeExtensions; [
      dash-to-dock
      blur-my-shell
      # ...
    ];

    dconf = {
      enable = true;
      settings = {
        "org/gnome/shell" = {
          disable-user-extensions = false; # enables user extensions
          enabled-extensions = with pkgs.gnomeExtensions; [
            # Put UUIDs of extensions that you want to enable here.
            # If the extension you want to enable is packaged in nixpkgs,
            # you can easily get its UUID by accessing its extensionUuid
            # field (look at the following example).
            gsconnect.extensionUuid
            blur-my-shell.extensionUuid
            dash-to-dock.extensionUuid
            user-themes.extensionUuid
          ];
        };
        
        # Configure individual extensions
        "org/gnome/shell/extensions/blur-my-shell" = {
          brightness = 0.50;
          noise-amount = 0;
        };

        "org/gnome/desktop/interface".color-scheme = "prefer-dark";
        
      };

    };
  };
}
