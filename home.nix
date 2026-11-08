{ config, pkgs, ... }: {

  programs.nixvim = {
    enable = true;
    defaultEditor = true;
    vimAlias = true;
    viAlias = true;

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
      maplocalleader = " ";
      have_nerd_font = true;
    };

    opts = {
      number = true; # number line
      relativenumber = true; # enable relative numbers
      cursorline = true; # highlight the current line
      colorcolumn = "80"; # a color column at 80
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
      swapfile = false;
      backup = false;
      termguicolors = true;
      encoding = "utf-8";
      fileencoding = "utf-8";
    };

    colorschemes.nightfox.enable = true;

    dependencies.ripgrep.enable = true;
    dependencies.fd.enable = true;

    plugins = {
      dropbar.enable = true;
      lualine.enable = true;
      treesitter.enable = true;

      lsp = {
        enable = true;
        servers = {
          nil_ls.enable = true;
          lua_ls.enable = true;
          ts_ls.enable = true;
          pyright.enable = true;
          solargraph.enable = true;
          gopls.enable = true;
          zls.enable = true;
          ols.enable = true;
          clangd.enable = true;
          html.enable = true;
          cssls.enable = true;
        };
      };

      rustaceanvim.enable = true;

      roslyn.enable = true;

      blink-cmp = {
        enable = true;
        settings.sources.default = [
          "lsp"
          "path"
          "buffer"
        ];
      };

      fidget.enable = true;

      smear-cursor.enable = true;

      telescope = {
        enable = true;
        keymaps = {
          "<leader>f" = "find_files";
          "<leader>g" = "live_grep";
          "<leader>G" = {
            action = "git_status";
            options.desc = "Git changed files";
          };
          "<leader>b" = "buffers";
          "<leader>s" = {
            action = "current_buffer_fuzzy_find";
            options.desc = "Search in current file";
          };
          "gd" = {
            action = "lsp_definitions";
            options.desc = "Goto definition";
          };
          "gr" = {
            action = "lsp_references";
            options = {
              desc = "References";
              nowait = true;
            };
          };
          "gi" = {
            action = "lsp_implementations";
            options.desc = "Goto implementation";
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
      mini-move.enable = true;
      mini-jump2d.enable = true;

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

      oil.enable = true;

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
            python = [
              "ruff_format"
              "isort"
            ];
            javascript = [ "prettier" ];
            javascriptreact = [ "prettier" ];
            typescript = [ "prettier" ];
            typescriptreact = [ "prettier" ];
            json = [ "jq" ];
            rust = [ "rustfmt" ];
            go = [
              "gofumpt"
              "goimports"
              "golines"
            ];
            zig = [ "zigfmt" ];
            cs = [ "csharpier" ];
            odin = [ "odinfmt" ];
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
          ];
          typescript = [ "eslint" ];
          javascript = [ "eslint" ];
          python = [
            "ruff"
            "mypy"
          ];
          go = [ "golangcilint" ];
          rust = [ "clippy" ];
          ruby = [ "rubocop" ];
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

      dashboard.enable = true;

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
        key = "<leader>o";
        action.__raw = "function() require('oil').open() end";
        options.desc = "Open file explorer (oil)";
      }
      {
        mode = "n";
        key = "]c";
        action.__raw = ''
          function()
            if vim.wo.diff then
              vim.cmd.normal({ "]c", bang = true })
            else
              require("gitsigns").nav_hunk("next")
            end
          end
        '';
        options.desc = "Next git change";
      }
      {
        mode = "n";
        key = "[c";
        action.__raw = ''
          function()
            if vim.wo.diff then
              vim.cmd.normal({ "[c", bang = true })
            else
              require("gitsigns").nav_hunk("prev")
            end
          end
        '';
        options.desc = "Prev git change";
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
