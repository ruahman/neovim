{ config, pkgs, ... }: {

  programs.nixvim = {
    enable = true;
    defaultEditor = true;
    vimAlias = true; # `vim` opens nixvim
    viAlias = true; # optional: `vi` too

    nixpkgs.useGlobalPackages = true;

    extraConfigLuaPre = ''
      -- let root (or any session without Wayland vars) reach ruahman's clipboard
      if not vim.env.WAYLAND_DISPLAY then
        vim.env.WAYLAND_DISPLAY = "wayland-0"
        vim.env.XDG_RUNTIME_DIR = vim.env.XDG_RUNTIME_DIR or "/run/user/1000"
      end
    '';

    clipboard.register = "unnamedplus";

    globals = {
      mapleader = " ";
      maplocalleader = " "; # optional; used by some filetype plugins
      have_nerd_font = true;
    };

    opts = {
      number = true;
      relativenumber = true;
      tabstop = 2; # insert space for tab
      shiftwidth = 2; # insert space for indent
      softtabstop = 2; # insert space when in insert
      expandtab = true; # expand tabs to space
      smarttab = true;
      smartindent = true;
      autoindent = true;
      spell = false;
      mouse = "a";
      showmode = false;
      undofile = true;
      ignorecase = true;
      smartcase = true;
      hlsearch = true;
      incsearch = true;
      syntax = "on";
      wrap = false;
    };

    colorschemes.nightfox.enable = true;

    dependencies.ripgrep.enable = true;
    dependencies.fd.enable = true;

    plugins = {
      lualine.enable = true;
      treesitter.enable = true;

      lsp = {
        enable = true;
        servers = {
          nil_ls.enable = true;
          lua_ls.enable = true;
        };
      };

      blink-cmp = {
        enable = true;
        settings.sources.default = [
          "lsp"
          "path"
          "buffer"
        ];
      };

      telescope = {
        enable = true;
        keymaps = {
          "<leader>f" = "find_files";
          "<leader>g" = "live_grep";
          "<leader>b" = "buffers";
          "<leader>s" = {
            action = "current_buffer_fuzzy_find";
            options.desc = "Search in current file";
          };
        };
      };

      lazygit = {
        enable = true;
        settings = {
          floating_window_scaling_factor = 0.9; # 90% of the screen
          floating_window_use_plenary = 0;
        };
      };

      mini-surround.enable = true;

      rainbow.enable = true;

      gitsigns = {
        enable = true;
        settings = {
          signs = {
            add.text = "▎";
            change.text = "▎";
            delete.text = "➤";
            topdelete.text = "➤";
            changedelete.text = "▎";
          };
        };
      };

      web-devicons.enable = true; # file icons in the tree

      neo-tree = {
        enable = true;
        settings = {
          close_if_last_window = true; # quit nvim if neo-tree is the only window left
          window = {
            position = "right"; # "left" is the default
            width = 35;
          };
          filesystem = {
            follow_current_file.enabled = false; # highlight the file you're editing
            filtered_items = {
              hide_dotfiles = false;
              hide_gitignored = false;
            };
          };
        };
      };

      bufferline = {
        enable = true;
        settings.options = {
          diagnostics = "nvim_lsp"; # show LSP error/warning counts on tabs
          always_show_bufferline = true;
          separator_style = "thin"; # "slant" | "thin" | "thick" | "padded_slant"
          offsets = [
            {
              filetype = "neo-tree"; # don't draw tabs over your neo-tree
              text = "File Explorer";
              highlight = "Directory";
              text_align = "center";
            }
          ];
        };
      };

      toggleterm = {
        enable = true;
        settings = {
          open_mapping = "[[<c-\\>]]"; # Ctrl-\ toggles the terminal
          direction = "float"; # or "horizontal" / "vertical" / "tab"
          float_opts = {
            border = "rounded";
            width.__raw = "function() return math.floor(vim.o.columns * 0.8) end";
            height.__raw = "function() return math.floor(vim.o.lines * 0.8) end";
          };
        };
      };

      conform-nvim = {
        enable = true;
        autoInstall.enable = true; # installs stylua + nixfmt from nixpkgs

        settings = {
          formatters_by_ft = {
            lua = [ "stylua" ];
            nix = [ "nixfmt" ]; # or "alejandra" if you prefer that style
          };

          format_on_save = {
            timeout_ms = 500;
            lsp_format = "fallback"; # use the LSP formatter if no conform formatter is set
          };
        };
      };

      lint = {
        enable = true;

        lintersByFt = {
          lua = [ "luacheck" ]; # same linter as your Lua config
          nix = [
            "statix"
            "deadnix"
          ]; # anti-patterns + unused code
        };

        autoInstall = {
          enable = true;
          # luacheck isn't a top-level package in nixpkgs, so point nixvim at it
          overrides.luacheck = pkgs.luajitPackages.luacheck;
        };

        # lint on open, after save, and when leaving insert mode
        autoCmd.event = [
          "BufReadPost"
          "BufWritePost"
          "InsertLeave"
        ];
      };

      mini-starter = {
        enable = true;
        settings = {
          evaluate_single = true; # run an item as soon as your typing matches only one

          header = ''
                __                                                                                              __                        
               / /_  ____  ____ ___  ___        ____ ___  ____ _____  ____ ____  _____   _    _______  ______ _/ /_  ____ ___  ____ _____ 
              / __ \/ __ \/ __ `__ \/ _ \______/ __ `__ \/ __ `/ __ \/ __ `/ _ \/ ___/  (_)  / ___/ / / / __ `/ __ \/ __ `__ \/ __ `/ __ \
             / / / / /_/ / / / / / /  __/_____/ / / / / / /_/ / / / / /_/ /  __/ /     _    / /  / /_/ / /_/ / / / / / / / / / /_/ / / / /
            /_/ /_/\____/_/ /_/ /_/\___/     /_/ /_/ /_/\__,_/_/ /_/\__, /\___/_/     (_)  /_/   \__,_/\__,_/_/ /_/_/ /_/ /_/\__,_/_/ /_/ 
                                                                   /____/                                                                 
          '';

          items = [
            {
              name = "New file";
              action = "enew";
              section = "Actions";
            }
            {
              name = "Find files";
              action = "Telescope find_files";
              section = "Actions";
            }
            {
              name = "Grep";
              action = "Telescope live_grep";
              section = "Actions";
            }
            {
              name = "Explorer";
              action = "Neotree toggle";
              section = "Actions";
            }
            {
              name = "Settings";
              action = "e /etc/nixos/neovim/root.nix";
              section = "Actions";
            }
            {
              name = "Quit";
              action = "qa";
              section = "Actions";
            }
            { __raw = "require('mini.starter').sections.recent_files(5, false)"; }
          ];

          content_hooks = [
            { __raw = "require('mini.starter').gen_hook.adding_bullet()"; }
            { __raw = "require('mini.starter').gen_hook.indexing('all', { 'Actions' })"; }
            { __raw = "require('mini.starter').gen_hook.aligning('center', 'center')"; }
          ];

          footer = "";
        };
      };

    };

    keymaps = [
      {
        mode = "n";
        key = "<leader>e";
        action.__raw = ''
          function()
            require("neo-tree.command").execute({ toggle = true, reveal = true })
          end
        '';
        options.desc = "File Explorer (Neo-tree)";
      }
      {
        mode = "n";
        key = "<leader>l";
        action.__raw = "function() require('lazygit').lazygit() end";
        options.desc = "Lazygit";
      }
      {
        mode = "n";
        key = "gh";
        action.__raw = "function() vim.lsp.buf.hover({ border = 'rounded' }) end";
        options.desc = "LSP hover";
      }
      {
        mode = "n";
        key = "ge";
        action.__raw = "function() vim.diagnostic.open_float({ border = 'rounded' }) end";
        options.desc = "Show diagnostic";
      }
      {
        mode = "n";
        key = "gd";
        action.__raw = "function() vim.lsp.buf.definition() end";
        options.desc = "Goto definition";
      }
      {
        mode = "n";
        key = "gr";
        action.__raw = "function() vim.lsp.buf.references() end";
        options = {
          desc = "References";
          nowait = true;
        };
      }
      {
        mode = "n";
        key = "gi";
        action.__raw = "function() vim.lsp.buf.implementation() end";
        options.desc = "Goto implementation";
      }
      {
        mode = "i";
        key = "<C-n>";
        action = "<Down>";
        options.desc = "Move down";
      }
      {
        mode = "i";
        key = "<C-p>";
        action = "<Up>";
        options.desc = "Move up";
      }
      {
        mode = "i";
        key = "<C-f>";
        action = "<Right>";
        options.desc = "Move right";
      }
      {
        mode = "i";
        key = "<C-b>";
        action = "<Left>";
        options.desc = "Move left";
      }
      {
        mode = "n";
        key = "<S-l>";
        action.__raw = "function() require('bufferline').cycle(1) end";
        options.desc = "Next buffer";
      }
      {
        mode = "n";
        key = "<S-h>";
        action.__raw = "function() require('bufferline').cycle(-1) end";
        options.desc = "Prev buffer";
      }
      {
        mode = "n";
        key = "gbd";
        action = "<cmd>bdelete<CR>";
        options.desc = "Close buffer";
      }
      {
        mode = "n";
        key = "<leader>X";
        action.__raw = "function() require('telescope.builtin').diagnostics() end";
        options.desc = "Diagnostics (workspace)";
      }
      {
        mode = "n";
        key = "<leader>x";
        action.__raw = "function() require('telescope.builtin').diagnostics({ bufnr = 0 }) end";
        options.desc = "Diagnostics (current file)";
      }
      {
        mode = "n";
        key = "<C-h>";
        action = "<C-w>h";
        options.desc = "Window left";
      }
      {
        mode = "n";
        key = "<C-j>";
        action = "<C-w>j";
        options.desc = "Window down";
      }
      {
        mode = "n";
        key = "<C-k>";
        action = "<C-w>k";
        options.desc = "Window up";
      }
      {
        mode = "n";
        key = "<C-l>";
        action = "<C-w>l";
        options.desc = "Window right";
      }
    ];

    autoCmd = [
      {
        event = "TextYankPost";
        desc = "Highlight when yanking text";
        callback.__raw = "function() vim.hl.on_yank() end";
      }
    ];
  };
}
