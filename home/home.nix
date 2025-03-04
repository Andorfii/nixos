{ pkgs, ... }:
{

  /* The home.stateVersion option does not have a default and must be set */
  home.stateVersion = "24.11";

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    shellAliases = {
      ll = "ls -la";
      update = "sudo nixos-rebuild switch";
    };

    initExtra = "pfetch";
  };

  home.packages = with pkgs; [
    git
	ripgrep     # Nixvim Telescope Dependency
    pfetch-rs
	fira-code
	papirus-icon-theme
    catppuccin-kde
    discord
    todoist-electron
    clapper # Video Player
    anki
    jq
  ];

  dconf.settings = {
    "org/virt-manager/virt-manager/connections" = {
      autoconnect = ["qemu:///system"];
      uris = ["qemu:///system"];
    };
  };
}
