{ config, pkgs, ... }: {
  programs.nixvim = {
    enable = true;
    defaultEditor = true;

    nixpkgs.source = pkgs;

    opts = {
      number = true;
      relativenumber = true;
      shiftwidth = 2;
      expandtab = true;
    };

    colorschemes.nightfox.enable = true;

    plugins = {
      lualine.enable = true;
      treesitter.enable = true;
      telescope.enable = true;
      
      lsp = {
        enable = true;
        servers = {
          nil_ls.enable = true;
        };
      };
    };
  };
}

