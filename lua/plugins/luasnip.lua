local export = {}

function export.config()
	local ls = require("luasnip")

	ls.config.set_config({
		history = true,
	})

	require("luasnip.loaders.from_vscode").lazy_load()

	require("luasnip.loaders.from_lua").load({ paths = "~/.config/nvim/lua/snippets" })

	vim.keymap.set({ "i", "s" }, "<c-n>", function()
		if ls.expand_or_jumpable(1) then
			ls.expand_or_jump()
		end
	end)

	vim.keymap.set({ "i", "s" }, "<c-p>", function()
		if ls.jumpable(-1) then
			ls.jump(-1)
		end
	end)

	-- vim.keymap.set({"i","s"}, "<CR>", function()
	--   if ls.choice_active() then
	--     ls.change_choice(1)
	--   end
	-- end)

	-- reload snippets
	-- vim.keymap.set("n", "<leader><leader>s", "<cmd>source ~/.config/nvim/lua/plugins/luasnip.lua<CR>")
end

return export
