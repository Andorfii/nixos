{ config, pkgs, ... }:
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
		action = ":below terminal nix develop <CR> 20<C-w>_ i"; 
	    key = "<leader>t"; 
		mode = "n";
	  }
      {
		action = ":below terminal zsh <CR> 20<C-w>_ i"; 
	    key = "<leader>T"; 
		mode = "n";
	  }
      {
		action = ":DapTerminate<CR>"; 
	    key = "<F4>"; 
		mode = "n";
	  }
      {
		action = ":DapContinue<CR>"; 
	    key = "<F5>"; 
		mode = "n";
	  }
      {
		action = ":DapStepOver<CR>";
	    key = "<F10>"; 
		mode = "n";
	  }
      {
		action = ":DapStepInto<CR>"; 
	    key = "<F11>"; 
		mode = "n";
	  }
      {
		action = ":DapStepOut<CR>"; 
	    key = "<F12>"; 
		mode = "n";
	  }
      {
		action = ":DapToggleBreakpoint<CR>"; 
	    key = "<leader>b"; 
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
          jdtls.enable = true;
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

      dap = {
        enable = true;
        extensions.dap-ui.enable = true;
        configurations = {
          java = [
            {
              type = "java";
              request = "launch";
              name = "Debug (Attach)";
            }
          ];
        };
      };
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
