require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all"
  ensure_installed = { "c", "cpp", "lua", "rust", "go", "python", "ruby" },

  -- highlight = {
  --   enable = true,
  -- },

  rainbow = {
    enable = true,
    extended_mode = true,
    max_file_lines = nil,
  }
}
