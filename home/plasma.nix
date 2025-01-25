{ pkgs, ... }:
{
  programs = { 
    plasma = {
      enable = true;

      workspace = {
		colorScheme = "CatppuccinFrappeBlue";
		splashScreen.theme = "None";
        iconTheme = "Papirus-Dark";
		wallpaper = pkgs.fetchurl {
		  url = "https://raw.githubusercontent.com/qbarone/spacedots/refs/heads/main/pianoouterspace.png";
		  hash = "sha256-pJNaFTEJNw2C8G2c9woueQguMoLWIZ4EFzqH+IIOYTw="; 
		};
      };
    };

	konsole = {
	  enable = true;
	  
	  customColorSchemes = { Catppuccin-Scheme = "${import ./konsole-theme.nix { inherit pkgs; } }/themes/catppuccin-mocha.colorscheme"; };

	  profiles.Catppuccin = {
	    name = "Catppuccin";
		colorScheme = "Catppuccin-Scheme";
		font = {
			name = "Fira Code";
			size = 10;
		};
	  	command = "${pkgs.zsh}/bin/zsh";
	  }; 

	  defaultProfile = "Catppuccin";
	};
  };
}
