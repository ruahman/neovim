# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

This is a Neovim configuration written in Lua, using [lazy.nvim](https://github.com/folke/lazy.nvim) as the plugin manager.

## Architecture

**Entry point:** `init.lua` → `require("config")` → `lua/config/init.lua`

The config module loads four core modules in order:
1. `config.settings` — Editor options (tabs, numbers, colors, etc.)
2. `config.keys` — Global keymaps (leader = `<Space>`)
3. `config.lazy` — Bootstraps lazy.nvim and loads all `lua/plugins/*.lua` files
4. `config.lsp` — LSP server configuration and LSP keymaps

**Plugin specs** live in `lua/plugins/` — one file per plugin. Each file returns a lazy.nvim spec table. Lazy loading is disabled by default (all plugins load eagerly).

**Utility functions** are in `lua/utils.lua` — contains a `keymap` helper used throughout.

**Custom snippets** are in `lua/snippets/` — language-specific LuaSnip snippets (go, javascript, python, rust, typescript).

## Key Plugin Choices

| Concern | Plugin |
|---|---|
| Completion | blink.cmp |
| Snippets | LuaSnip |
| LSP install | mason + mason-lspconfig |
| Fuzzy find | Telescope |
| Formatting | conform.nvim |
| Linting | nvim-lint |
| Debugging | nvim-dap |
| Syntax | nvim-treesitter |
| Git UI | lazygit.nvim |
| File tree | nvim-tree |
| Colorscheme | nightfox (primary) |

## LSP Servers Configured

`lua_ls`, `ts_ls`, `pyright`, `solargraph`, `gopls`, `zls`, `clangd`, `html`, `cssls`

Rust uses `rustaceanvim` instead of a standard lspconfig entry.

## Formatters / Linters

- **Formatters** (conform.nvim): stylua, prettier, ruff_format, rustfmt, gofumpt, zig fmt
- **Linters** (nvim-lint): eslint, luacheck, mypy, ruff, golangcilint, clippy, rubocop

## Linting the Config

```sh
luacheck lua/
```

`.luacheckrc` defines known globals (`vim`, `require`, `s`, `fmt`, `i`, etc.).

## Adding a Plugin

Create `lua/plugins/<name>.lua` returning a lazy.nvim spec table. It will be auto-discovered.

## Updating Plugins

Run `:Lazy update` inside Neovim. Commit the resulting `lazy-lock.json` to pin versions.
