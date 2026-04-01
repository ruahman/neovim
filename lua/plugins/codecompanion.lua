return {
	"olimorris/codecompanion.nvim",
	version = vim.version.range("^19.0.0"),
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	keys = {
		{ "<leader>cc", "<cmd>CodeCompanionChat<cr>", desc = "Toggle CodeCompanion Chat" },
		{ "<leader>cA", "<cmd>CodeCompanionActions<cr>", desc = "CodeCompanion Actions" },
		{ "<leader>ca", "<cmd>CodeCompanionChat Add<cr>", desc = "CodeCompanion Add to Chat", mode = { "n", "v" } },
		{ "<leader>ct", "<cmd>CodeCompanionCLI<cr>", desc = "CodeCompanion CLI" },
		{ "<leader>ci", "<cmd>CodeCompanion<cr>", desc = "CodeCompanion Inline", mode = { "n", "v" } },
	},
	config = function()
		-- Expand 'cc' into 'CodeCompanion' in the command line
		vim.cmd([[cab cc CodeCompanion]])

		require("codecompanion").setup({
			adapters = {
				acp = {
					claude_code = function()
						return require("codecompanion.adapters").extend("claude_code", {
							env = {
								CLAUDE_CODE_OAUTH_TOKEN = "CLAUDE_CODE_OAUTH_TOKEN",
							},
						})
					end,
				},
			},
			interactions = {
				chat = {
					adapter = "claude_code",
					opts = {
						completion_provider = "blink",
					},
					keymaps = {
						send = {
							modes = { n = "<C-s>", i = "<C-s>" },
							opts = {},
						},
						close = {
							modes = { n = "<C-x>", i = "<C-x>" },
							opts = {},
						},
					},
					slash_commands = {
						["file"] = {
							-- Use Telescope as the provider for the /file command
							opts = {
								provider = "snacks",
							},
						},
					},
				},
				inline = {
					adapter = "copilot",
				},
				cli = {
					agent = "claude_code",
					agents = {
						claude_code = {
							cmd = "claude",
							args = {},
							description = "Claude Code CLI",
							provider = "terminal",
						},
					},
				},
			},
		})
	end,
}
