{ pkgs, catppuccin, ... }:
{

  /* The home.stateVersion option does not have a default and must be set */
  home.stateVersion = "24.11";

  home.packages = with pkgs; [
    git
    kitty
    papirus-icon-theme
    neovim
  ];

  catppuccin = {
    flavor = "mocha";
    enable = true;
  };
}
