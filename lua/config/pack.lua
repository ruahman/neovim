
-- Ensure a writable packpath entry exists
local pack_dir = vim.fn.stdpath("data") .. "/site"
vim.fn.mkdir(pack_dir .. "/pack/plugins/opt", "p")
vim.opt.packpath:prepend(pack_dir)

-- loop through lua/plugins
for _, file in ipairs(vim.fn.glob(vim.fn.stdpath("config") .. "/lua/plugins/*.lua", false, true)) do
 	local mod = vim.fn.fnamemodify(file, ":t:r")
  if vim.tbl_contains({"colorizer","snacks", "mini", "nvim-treesitter", "nvim-lspconfig"}, mod) then
    print(mod)
	  local plugin = require("plugins." .. mod)

    -- package
    vim.pack.add({ "https://github.com/" .. plugin[1] })

    -- dependencies
    if plugin.dependencies then 
      for _, dep in ipairs(plugin.dependencies) do
        vim.pack.add({ "https://github.com/" .. dep })
      end
    end

    -- setup
    if plugin.opts then
      require(mod).setup(plugin.opts)
    end

    -- keys
    if plugin.keys then
      for _, key in ipairs(plugin.keys) do
        vim.keymap.set(
          key.mode or "n",
          key[1],
          key[2],
          { desc = key.desc, nowait = key.nowait }
        )
      end
    end

    -- config
    if plugin.config then
      plugin.config()
    end
  end
end

-- Run TSUpdate after treesitter is installed or updated
vim.api.nvim_create_autocmd("PackChanged", {
	callback = function(ev)
		if ev.data.spec.name == "nvim-treesitter" and (ev.data.kind == "install" or ev.data.kind == "update") then
			vim.cmd("TSUpdate")
		end
	end,
})
