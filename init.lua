-- `https://learnxinyminutes.com/docs/lua/`
-- :help lua-guide or https://neovim.io/doc/user/lua-guide.html
-- :Turor - for beginners
-- :checkhealth - If you experience any errors while trying to install kickstart

--  NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used)
vim.g.mapleader = ' ' -- `:help mapleader`
vim.g.maplocalleader = ' '

-- true -> Nerd Font is installed and selected in the terminal
vim.g.have_nerd_font = true

require 'options'
require 'autocommands'
require 'keymaps'
require 'plugin-manager'

local plugin_configs = require 'plugin-configs'

--  To check the current status of your plugins, run `:Lazy`
--  You can press `?` in this menu for help. Use `:q` to close the window
--  To update plugins you can run `:Lazy update`
require('lazy').setup({
  plugin_configs.sleuth_config(),
  plugin_configs.gitsigns_config(),
  plugin_configs.which_key_config(),
  plugin_configs.telescope_config(),

  -- LSP Plugins
  plugin_configs.lazydev_config(),
  plugin_configs.luvit_meta_config(),
  plugin_configs.nvim_lsp_config(),
  plugin_configs.conform_config(),
  plugin_configs.nvim_cmp_config(),

  plugin_configs.outline_config(),

  -- plugin_configs.tokyonight_config(),
  plugin_configs.tokyodark_config(),
  -- plugin_configs.catppuchin_config(),

  plugin_configs.todo_comments_config(),
  -- plugin_configs.ufo_config(), -- trialing builtin folding from 2026-04-21; uncomment to roll back

  plugin_configs.mini_config(),
  plugin_configs.nvim_treesitter_config(),
  plugin_configs.nvim_treesitter_context_config(),

  plugin_configs.nvim_tree_config(),
  plugin_configs.indent_blankline_config(),
  plugin_configs.nvim_lint_config(),

  --
  -- For additional information with loading, sourcing and examples see `:help lazy.nvim-🔌-plugin-spec`
  -- Or use telescope!
  -- In normal mode type `<space>sh` then write `lazy.nvim-plugin`
  -- you can continue same window with `<space>sr` which resumes last telescope search
}, {
  ui = {
    -- If you are using a Nerd Font: set icons to an empty table which will use the
    -- default lazy.nvim defined Nerd Font icons, otherwise define a unicode icons table
    icons = vim.g.have_nerd_font and {} or {
      cmd = '⌘',
      config = '🛠',
      event = '📅',
      ft = '📂',
      init = '⚙',
      keys = '🗝',
      plugin = '🔌',
      runtime = '💻',
      require = '🌙',
      source = '📄',
      start = '🚀',
      task = '📌',
      lazy = '💤 ',
    },
  },
})

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
