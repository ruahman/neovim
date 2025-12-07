local function config()
	local ls = require("luasnip")

	ls.config.set_config({
		history = true,
	})

	-- update snippets when textChanged ???
	-- ls.setup({
	-- 	update_events = { "TextChanged", "TextChangedI" },
	-- })

	require("luasnip.loaders.from_vscode").lazy_load()

	require("luasnip.loaders.from_lua").load({
		paths = vim.fn.stdpath("config") .. "/lua/snippets",
	})

	-- expand snippet or jump to next placeholder
	vim.keymap.set({ "i", "s" }, "<c-n>", function()
		if ls.expand_or_jumpable(1) then
			ls.expand_or_jump()
		end
	end)

	-- go to previous placeholder
	vim.keymap.set({ "i", "s" }, "<c-p>", function()
		if ls.jumpable(-1) then
			ls.jump(-1)
		end
	end)

	-- go through choices
	vim.keymap.set({ "i", "s" }, "<c-l>", function()
		if ls.choice_active() then
			ls.change_choice(1)
		end
	end)

	-- vim.keymap.set({ "n" }, "<Leader><Leader>s", function()
	-- 	require("luasnip.loaders").edit_snippet_files()
	-- end)
end

-- return export
return {
	"L3MON4D3/LuaSnip",
	dependencies = {
		"rafamadriz/friendly-snippets",
	},
	event = "InsertEnter",
	config = config,
	-- enabled = false,
}
