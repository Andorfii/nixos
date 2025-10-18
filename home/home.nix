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

    initContent = "pfetch\n bindkey -e\nbindkey \"^[[1;5C\" forward-word\nbindkey \"^[[1;5D\" backward-word";
  };

  home.packages = with pkgs; [
    firefox
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
    jdk
    prismlauncher
    qbittorrent
    libreoffice-qt
    # Japanese Fonts
    noto-fonts-cjk-sans 
    noto-fonts-cjk-serif
    # Haskell
    cabal-install
    ghc
    stack
    # Prolog
    swi-prolog
    # C/C++
    gcc
    # Python
    python314
  ];

  programs.vscode = {
    enable = true;
    profiles.default.extensions = with pkgs.vscode-extensions; [
        vscjava.vscode-spring-initializr
        ms-python.python
    ];
  };

  dconf.settings = {
    "org/virt-manager/virt-manager/connections" = {
      autoconnect = ["qemu:///system"];
      uris = ["qemu:///system"];
    };
  };
}
