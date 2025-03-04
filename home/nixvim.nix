{ pkgs, ... }:
{

  programs.nixvim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;

    colorschemes.catppuccin.enable = true;

    luaLoader.enable = true;
	globals = {
	  mapleader = " ";
	  maplocalleader = " ";
	};

    clipboard = {
        register = "unnamedplus";
        providers.wl-copy.enable = true;
    };

	keymaps = [
	  {
	  	action = ":Ex<CR>";
		key = "<leader>pv";
	    mode = "n";
	  }
	  {
	  	action = ":bnext<CR>";
		key = "<leader>n";
	    mode = "n";
	  }
	  {
	  	action = ":bprevious<CR>";
		key = "<leader>p";
	    mode = "n";
	  }
	  {
	  	action = ":bdelete<CR>";
		key = "<leader>d";
	    mode = "n";
	  }
      {
		action = ":w <CR> :below terminal g++ % -o %< && %< <CR>";
	    key = "<F8>"; 
		mode = "n";
	  }
      {
		action = ":w <CR> :below terminal g++ % -o %< && %< \< %:p:h/input <CR>";
	    key = "<F9>"; 
		mode = "n";
	  }
      {
		action = ":below terminal nix develop <CR> 20<C-w>_ i"; 
	    key = "<leader>t"; 
		mode = "n";
	  }
      {
		action = ":below terminal zsh <CR> 20<C-w>_ i"; 
	    key = "<leader>T"; 
		mode = "n";
	  }
	];

    plugins = {
      web-devicons.enable = true; # Telescope dependency
      autoclose.enable = true;
	  telescope = {
	    enable = true;
		keymaps = {
		  "<leader>pf" = {
		    action = "find_files";
			mode = "n";
		  };
		  "<C-p>" = {
		    action = "git_files";
			mode = "n";
		  };
		  "<leader>ps" = {
		    action = "live_grep";
			mode = "n";
		  };
		};
	  };
      
      treesitter = {
        enable = true;
        settings.highlight.enable = true;
      };

      lsp = {
        enable = true;
        servers = {
	  # Nix
          nixd.enable = true;
	  # Python
          pyright.enable = true;
	  # C/C++
#          clangd.enable = true;
      # Java
           java_language_server.enable = true;
        };
      };
      
      cmp = {
        autoEnableSources = true;
        settings.sources = [
          { name = "nvim_lsp"; }
          { name = "path"; }
          { name = "buffer"; }
        ];
      };

      vim-be-good.enable = true;
    };

    opts = {
      nu = true;
      relativenumber = true;
    
      tabstop = 4;
      shiftwidth = 4;
      expandtab = true;
    
      smartindent = true;

      hlsearch = false;
      incsearch = true;
    };
  };
}
