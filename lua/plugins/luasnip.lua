local ls = require("luasnip")

local snip = ls.snippet
local node = ls.snippet_node
local text = ls.text_node
local insert = ls.insert_node
local func = ls.function_node
local choice = ls.choice_node
local dynamicn = ls.dynamic_node

require("luasnip.loaders.from_vscode").lazy_load()

local date = function() return {os.date('%Y-%m-%d')} end

ls.add_snippets("all", {
    snip({
        trig = "date",
        namr = "Date",
        dscr = "Date in the form of YYYY-MM-DD",
    }, {
        func(date, {}),
    }),
    snip({
        trig = "meta",
        namr = "Metadata",
        dscr = "Yaml metadata format for markdown"
    },
    {
        text({"---",
        "title: "}), insert(1, "note_title"), text({"", 
        "author: "}), insert(2, "author"), text({"", 
        "date: "}), func(date, {}), text({"",
        "categories: ["}), insert(3, ""), text({"]",
        "lastmod: "}), func(date, {}), text({"",
        "tags: ["}), insert(4), text({"]",
        "comments: true",
        "---", ""}),
        insert(0)
    }),
})


local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }
keymap("i", "<c-j>", "<cmd>lua require'luasnip'.jump(1)<CR>", opts)
keymap("s", "<c-j>", "<cmd>lua require'luasnip'.jump(1)<CR>", opts)
keymap("i", "<c-k>", "<cmd>lua require'luasnip'.jump(-1)<CR>", opts)
keymap("s", "<c-k>", "<cmd>lua require'luasnip'.jump(-1)<CR>", opts)

