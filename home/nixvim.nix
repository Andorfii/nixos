{ ... }:
{

  programs.nixvim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;

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
      lspconfig.enable = true;      
      vim-be-good.enable = true;
    };

    opts = {
      tabstop = 4;
      shiftwidth = 4;
      expandtab = false;
    };
  };
}
