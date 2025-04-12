return {
	"ThePrimeagen/harpoon",
	dependencies = { "nvim-lua/plenary.nvim" },
	enabled = false,
	config = function()
		local harpoon = require("harpoon")
		-- harpoon.setup({
		-- 	save_on_toggle = true,
		-- 	save_on_change = true,
		-- })
		harpoon.setup()

		local mark = require("harpoon.mark")
		local ui = require("harpoon.ui")

		vim.keymap.set("n", "ha", function()
			print("add file to harpoon...")
			mark.add_file()
		end, { desc = "Add file to Harpoon" })

		vim.keymap.set("n", "hr", function()
			print("remove file from harpoon...")
			mark.rm_file()
		end, { desc = "Remove file from Harpoon" })

		vim.keymap.set("n", "he", ui.toggle_quick_menu, { desc = "Toggle Harpoon menu" })

		vim.keymap.set("n", "<leader>h", require("telescope").extensions.harpoon.marks, { desc = "Find Harpoon Marks" })
	end,
}
