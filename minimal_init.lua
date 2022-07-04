-- ignore default config and plugins
vim.opt.runtimepath:remove(vim.fn.stdpath("config"))
vim.opt.packpath:remove(vim.fn.stdpath("data") .. "/site")
vim.opt.termguicolors = true

-- append test directory
local test_dir = "/tmp/nvim-config"
vim.opt.runtimepath:append(vim.fn.expand(test_dir))
vim.opt.packpath:append(vim.fn.expand(test_dir))

-- install packer
local install_path = test_dir .. "/pack/packer/start/packer.nvim"
local install_plugins = false

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  vim.cmd("!git clone https://github.com/wbthomason/packer.nvim " .. install_path)
  vim.cmd("packadd packer.nvim")
  install_plugins = true
end

local packer = require("packer")

packer.init({
  package_root = test_dir .. "/pack",
  compile_path = test_dir .. "/plugin/packer_compiled.lua",
})

packer.startup(function(use)
  -- Packer can manage itself
  use("wbthomason/packer.nvim")

  use("mfussenegger/nvim-dap")
  use({
    "rcarriga/nvim-dap-ui",
    config = function()
      require("dapui").setup({
        layouts = {
          {
            elements = {
            -- Elements can be strings or table with id and size keys.
              { id = "scopes", size = 0.25 },
              "watches",
              "stacks",
            },
            size = 40, -- 40 columns
            position = "left",
          },
          {
            elements = {
              "repl",
            },
            size = 0.25, -- 25% of total lines
            position = "bottom",
          },
        },
      })
    end,
  })

  if install_plugins then
    packer.sync()
  end
end)

vim.cmd([[
command! DapUIToggle lua require("dapui").toggle()
]])
