return {
	-- parse("expand","-- this is what was expanded!"),
	-- parse("lf", "local $1 = function($2)\n $0\nend"),
	-- s("testxxxx", t "foobar"),
	-- s("test2222", { t({"foobar2",""}), i(1, "test2"), t "end" }),
	-- s("todo", {
	--   c(1, {
	--     t "TODO",
	--     t "NEXT",
	--     t "DONE",
	--     t "CANCEL",
	--   })
	-- }),
	-- s(
	--   "secondSnippet",
	--   fmt(
	--   [[
	--     local {} = function({})
	--       {}
	--     end
	--     ]], {
	--       i(1,"myVar"),
	--       c(2,{t"option2", t"myArg", t""}),
	--       i(3,"-- TODO: something")
	--     }
	--   )
	-- ),
	-- s("curtime",f(function()
	--   return os.date "%D - %H:%M"
	-- end)),
	-- s({ trig = "digit(%d%d)", regTrig = true, hidden=true },
	--   f(function(_, snip)
	--     return snip.captures[1]
	--   end)
	-- ),
	-- s({ trig = "auto", regTrig = true, hidden=true }, {
	--   i(1, "uppcase me "),
	--   f(function(arg)
	--     return arg[1][1]:upper() .. arg[2][1]:lower()
	--   end,{1,2}),
	--   i(2, " LOWERCASE ME")
	-- }),
	-- s("regparts",fmt([[
	--   local {} = require "{}"
	-- ]],{
	--   f(function(args)
	--     local parts = vim.split(args[1][1], ".", true)
	--     return parts[#parts] or ""
	--   end,{1}),
	--   i(1)
	-- })),
	-- s({ trig = "for([%w_]+)", regTrig = true, hidden = true },
	-- fmt([[
	-- for(let {} = 0; {} < {}; {}++) {{
	--   {}
	-- }}
	-- ]],{
	--   d(1, function(_, snip)
	--     -- a dynamic node is a function node
	--     -- that returns a snipit node instead of text
	--     return sn(1, i(1, snip.captures[1]))
	--   end),
	--   rep(1),
	--   c(2, { i(1,"num"), sn(1, { i(1,"arr"), t(".length") }) }),
	--   rep(1),
	--   i(3)
	-- }))
}
