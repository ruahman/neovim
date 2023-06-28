local export = {}

function export.config()
  require("telescope").setup({
    defaults = {
      mappings = {
        n = {
          ["bd"] = require("telescope.actions").delete_buffer,
        },
        i = {
          ["bd"] = require("telescope.actions").delete_buffer,
        },
      },
    },
  })

  -- load faster fuzy finder
  require("telescope").load_extension("fzf")

  local builtin = require("telescope.builtin")

  vim.keymap.set("n", "<leader>ff", builtin.find_files)               -- list files
  vim.keymap.set("n", "<leader>fb", builtin.buffers)                  -- list buffers
  vim.keymap.set("n", "<leader>fs", builtin.current_buffer_fuzzy_find) -- search in buffer
  vim.keymap.set("n", "<leader>fg", builtin.live_grep)                -- grep in dir
end

return export
