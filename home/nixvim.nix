{ pkgs, ... }:
{

  programs.nixvim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;

    colorschemes.catppuccin.enable = true;

    luaLoader.enable = true;
     
    plugins = {
      lsp = {
        enable = true;

        servers = {
	  # Nix
          nixd.enable = true;
	  # Python
          pyright.enable = true;
	  # C/C++
          clangd.enable = true;
        };
      };
      vim-be-good.enable = true;
    };

    opts = {
      tabstop = 4;
      shiftwidth = 4;
      expandtab = false;
    };
  };
}
