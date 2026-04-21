I read through the 0.12 release notes and cross-referenced with your config. Here's a prioritized analysis of what's worth changing. Grouped from "high leverage, low risk" to "bigger bets."

## High leverage, worth doing

**1. Migrate LSP setup off `mason-lspconfig.handlers` to `vim.lsp.config` + `vim.lsp.enable`** (`plugin-configs.lua:294-513`)

This is the most impactful change. 0.11 introduced `vim.lsp.config()`/`vim.lsp.enable()`, and 0.12 rounds it out:
- `vim.lsp.is_enabled()`, `vim.lsp.get_configs()`
- `:lsp` command to interactively manage clients
- `:checkhealth vim.lsp` shows which buffers each client is attached to
- `vim.lsp.Config` gained `workspace_required` and priority for `root_markers`
- `cmd` function form now receives the resolved config as 2nd arg

`mason-lspconfig` v2 deprecated the `handlers = {...}` pattern you're using. New pattern: drop `nvim-lspconfig` entirely (or keep only as a provider of default configs), set per-server overrides in `lsp/<name>.lua` files under the runtime path, and call `vim.lsp.enable({'gopls','pyright','rust_analyzer','lua_ls','docker_compose_language_service'})`. `cmp_nvim_lsp.default_capabilities()` merging can move into `vim.lsp.config('*', { capabilities = ... })`.

**2. Trim LSP keymaps that now ship as defaults** (`plugin-configs.lua:372-376`)

0.11/0.12 defaults already bind:
- `grn` → rename (you have `<leader>rn`)
- `gra` → code action (you have `<leader>ca`)
- `grr` → references (you override to telescope, fine)
- `gri` → implementation
- `grt` → `vim.lsp.buf.type_definition()` *(new in 0.12, replaces your `<leader>D`)*
- `grx` → `vim.lsp.codelens.run()` *(new in 0.12)*
- `gO` → document symbols

You can keep the telescope-powered ones, but `<leader>D` and hand-rolled codelens bindings are redundant now. Also code lenses render as **virtual lines** by default in 0.12.

**3. Default statusline now has what `mini.statusline` gives you** (`plugin-configs.lua:787-808`)

0.12's default `'statusline'` is a real expression that already shows `vim.diagnostic.status()`, `vim.ui.progress_status()`, `:terminal` exit code, and the new `'busy'` buffer status (◐). If you only kept `mini.statusline` for diagnostics + a mode color, you can drop it and customize default `'statusline'` with your three HL groups. Keep it if you value the mode-tinted background.

**4. Consider dropping `nvim-ufo`** (`plugin-configs.lua:1078-1137`)

Built-in LSP folding (`vim.lsp.foldexpr`, `foldtext` = `vim.lsp.foldtext` or treesitter equivalent) has been usable since 0.11; 0.12 adds `fillchars` `foldinner`. ufo's fold preview is nice, but if you don't rely on it, 30 lines of builtin config replace the plugin + `promise-async` dep.

**5. `pumborder` / `pummaxwidth` / native completion polish**

You already set `winborder = 'rounded'`. 0.12 adds `'pumborder'` (border for the completion menu specifically) and `'pummaxwidth'`. Add them to `options.lua` — they apply regardless of whether you keep nvim-cmp.

## Medium: evaluate, don't rush

**6. Built-in completion (replace `nvim-cmp`)** (`plugin-configs.lua:563-680`)

0.12 makes `vim.lsp.completion.enable()` genuinely viable:
- `cmp` option for custom ordering
- color item previews
- resolve preview with `completeopt+=popup`
- `'autocomplete'` option (triggers without `<C-x><C-o>`)
- `'complete'` flag `"F{func}"`, `"nearest"` sorting in `'completeopt'`
- `'smartcase'` now applies to completion filtering
- snippet tabstop highlight (`SnippetTabstopActive`)
- improved signature help rendering

Tradeoff: nvim-cmp's multi-source UX (path + luasnip + lsp + lazydev all in one menu) is still richer. Only switch if you want less infra; leave it alone if cmp isn't bothering you.

**7. Inline completion / workspace diagnostics / document color**

- `textDocument/inlineCompletion` — native inline (ghost-text) completion if your LSP supports it.
- `vim.lsp.buf.workspace_diagnostics()` — pulls diagnostics across the workspace without telescope.
- `textDocument/documentColor` / `lsp-document_color` — live color swatches in CSS/Tailwind.

Opt-in based on the languages you actually use.

**8. `v_an` / `v_in` — treesitter incremental selection is built-in**

You don't have a textobjects plugin, so nothing to remove; just know you get this for free.

## Big bet: plugin manager

**9. `vim.pack` replaces `lazy.nvim`**

0.12 ships a built-in plugin manager. `lazy.nvim`'s lazy-loading (`event`, `ft`, `cmd`, `keys`) is still more sophisticated. I wouldn't migrate unless you're specifically trying to reduce dependencies.

## Small fixes / hygiene

- `signcolumn = 'auto:2'` in `options.lua:120` — fine, but default 'statusline' and new diagnostic model mean you can drop down to `'yes:1'` with no info loss.
- `cmdheight = 2` (`options.lua:124`) — 0.12's ui2 experiment and improved message routing often make `cmdheight=1` more comfortable. Try `require('vim._core.ui2').enable()` experimentally.
- `vim.diagnostic.config { signs = ... }` at `plugin-configs.lua:431` — already on the modern API, good. Just note `:sign-define` / `sign_define()` for diagnostic signs is now hard-removed.
- 0.11+ deprecated `vim.lsp.util.open_floating_preview` style helpers; you're not using them, just a heads-up.
- `autocommands.lua`/`keymaps.lua` — worth a scan for any `vim.diagnostic.disable/is_disabled` (removed in 0.12) and `vim.diff` → `vim.text.diff`.

## Suggested order

1. Add `pumborder`/`pummaxwidth` to `options.lua`. (1 min)
2. Remove `<leader>D`, rely on `grt`. (1 min)
3. Migrate `nvim_lsp_config` to `vim.lsp.config` + `vim.lsp.enable`, drop `mason-lspconfig` handlers. (30 min, biggest win)
4. Try built-in folding for a week; if fine, delete ufo.
5. Decide on statusline / cmp after living with 1–4.

Want me to draft the `vim.lsp.config`/`enable` migration for step 3?
