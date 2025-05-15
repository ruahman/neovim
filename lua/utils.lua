local M = {}

function M.print_table(t, indent)
	indent = indent or 0
	local indent_str = string.rep("  ", indent)
	for key, value in pairs(t) do
		if type(value) == "table" then
			print(indent_str .. key .. ":")
			M.print_table(value, indent + 1)
		else
			print(indent_str .. key .. ": " .. tostring(value))
		end
	end
end

function M.map(mode, lhs, rhs, opts)
	local options = { noremap = true, silent = false }
	if opts then
		options = vim.tbl_extend("force", options, opts)
	end
	vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- get test executable
function M.get_test_executable()
	-- get crate name
	local crate_name = M.get_crate_name()

	-- get metadata
	local metadata = vim.fn.json_decode(vim.fn.system("cargo metadata --format-version=1"))

	-- if no metadata
	if not metadata then
		vim.fn.system("cargo test --no-run")
		return vim.fn.getcwd() .. "/target/debug/" .. crate_name
	end

	for _, pkg in ipairs(metadata.packages) do
		if pkg.name == crate_name then
			for _, target in ipairs(pkg.targets) do
				if vim.tbl_contains(target.kind, "test") or vim.tbl_contains(target.kind, "bin") then
					vim.fn.system("cargo test --no-run")
					local dep_path = vim.fn.glob(metadata.target_directory .. "/debug/deps/" .. target.name .. "-*")
					local paths = vim.split(dep_path, "\n", { trimempty = true })
					local filtered_paths = vim.tbl_filter(function(path)
						return not path:match("%.d$")
					end, paths)
					local most_recent = nil
					local latest_time = -1

					for _, file in ipairs(filtered_paths) do
						local mtime = vim.fn.getftime(file)
						if mtime > latest_time then
							latest_time = mtime
							most_recent = file
						end
					end

					if most_recent ~= nil then
						return most_recent
					end
				end
			end
		end
	end

	-- fallback
	vim.fn.system("cargo test --no-run")
	return vim.fn.getcwd() .. "/target/debug/" .. crate_name
end

-- Get crate name from Cargo.toml
function M.get_crate_name()
	-- Search for Cargo.toml upward from the current file
	local cargo_toml = vim.fn.findfile("Cargo.toml", vim.fn.expand("%:p:h") .. ";")

	-- if cargo not found
	if cargo_toml == "" then
		-- Fallback to directory name
		return vim.fn.fnamemodify(vim.fn.getcwd(), ":t")
	end

	-- read cargo file
	local lines = vim.fn.readfile(cargo_toml)
	-- find name
	for _, line in ipairs(lines) do
		local name = line:match('^name%s*=%s*"(.-)"')
		if name then
			-- return name of cargo
			return name
		end
	end
	-- Fallback to using dir name if no name is found
	return vim.fn.fnamemodify(vim.fn.getcwd(), ":t")
end

function M.get_test_name()
	-- get current buffer
	local bufnr = vim.api.nvim_get_current_buf()
	-- get current position
	local pos = vim.api.nvim_win_get_cursor(0) -- [row, col], 0-based
	-- get row and column
	local row, col = pos[1] - 1, pos[2]

	-- Get the Treesitter parser for Rust
	local parser = vim.treesitter.get_parser(bufnr, "rust")
	-- get tree
	local tree = parser:parse()[1]
	-- get root of tree
	local root = tree:root()

	local query = vim.treesitter.query.parse(
		"rust",
		[[
      (attribute_item
        (attribute) @attr (#match? @attr "#\\[test\\]"))
    ]]
	)

	print("start query")
	for id, node in query:iter_captures(root, bufnr, row, row + 1) do
		print(id)
		print(node)
		local capture_name = query.captures[id]
		print(capture_name)
		if capture_name == "test_name" then
			local start_row, start_col, end_row, end_col = node:range()
			if start_row <= row and row <= end_row then
				-- return test_name???
				return vim.treesitter.get_node_text(node, bufnr)
			end
		end
	end
	print("found nothing")

	return nil
end

return M
