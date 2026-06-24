# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

This is a Neovim configuration written in Lua, using `vim.pack` (Neovim's built-in package manager) with a custom loader (`lua/config/pack.lua`).

## Architecture

**Entry point:** `init.lua` → `require("config")` → `lua/config/init.lua`

The config module loads four core modules in order:
1. `config.options` — Editor options (tabs, numbers, colors, etc.)
2. `config.keymaps` — Global keymaps (leader = `<Space>`)
3. `config.pack` — Custom plugin loader using `vim.pack.add()`, iterates over `lua/plugins/*.lua`
4. `config.lsp` — LSP server enablement via `vim.lsp.enable()` and LSP keymaps

**Plugin specs** live in `lua/plugins/` — one file per plugin. Each file returns a table with a lazy.nvim-style structure (repo path, opts, keys, config, dependencies) that `pack.lua` translates into `vim.pack.add()` calls.

**Custom snippets** are in `lua/snippets/` — language-specific LuaSnip snippets (go, javascript, python, rust, typescript).

## Key Plugin Choices

| Concern | Plugin |
|---|---|
| Completion | blink.cmp |
| Snippets | LuaSnip |
| LSP config | nvim-lspconfig + vim.lsp.enable() |
| Fuzzy find | snacks.nvim (picker) |
| Formatting | conform.nvim |
| Linting | nvim-lint |
| Debugging | nvim-dap |
| Syntax | nvim-treesitter |
| Git UI | lazygit (via snacks.nvim) |
| File explorer | snacks.nvim (explorer), oil.nvim, mini.files |
| AI assistant | codecompanion.nvim |
| Copilot | copilot.lua + blink-copilot |
| Colorscheme | nightfox |

## LSP Servers Configured

`copilot`, `lua_ls`, `ts_ls`, `pyright`, `solargraph`, `gopls`, `zls`, `clangd`, `html`, `cssls`

Rust uses `rustaceanvim` instead of a standard lspconfig entry.

## Formatters / Linters

- **Formatters** (conform.nvim): stylua, prettier, ruff_format, isort, rustfmt, gofumpt, goimports, golines, jq, zig fmt
- **Linters** (nvim-lint): eslint, luacheck, mypy, ruff, golangcilint, clippy, rubocop

## Linting the Config

```sh
luacheck lua/
```

`.luacheckrc` defines known globals (`vim`, `require`, `s`, `fmt`, `i`, etc.).

## Adding a Plugin

Create `lua/plugins/<name>.lua` returning a table with the repo as `[1]` (e.g. `"user/repo"`), plus optional `opts`, `keys`, `config`, `dependencies`, `version`, `branch`, and `build` fields. It will be auto-discovered by `pack.lua`.

## Updating Plugins

Run `:Pack update` inside Neovim. Commit the resulting lock file to pin versions.
