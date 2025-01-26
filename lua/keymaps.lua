-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

-- Modes - mine
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

--  `nore` mean NOT RECURSION .. for cases like `:inoremap ff fff`

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- TIP: Disable arrow keys in normal mode
-- vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
-- vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
-- vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
-- vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
-- vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
-- vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
-- vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
-- vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

--
----- mine ---
--

-- inoremap jf <Esc>l
vim.api.nvim_set_keymap('i', 'jf', '<Esc>l', { noremap = true })

-- nnoremap <C-q><C-q> :qall!
-- nnoremap <leader>qa :qall! <CR>
-- nnoremap <leader>qq :q! <CR>
vim.api.nvim_set_keymap('n', '<leader>qa', ':qall!<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>qq', ':q!<CR>', { noremap = true })
-- nnoremap <C-b> :bp<CR>
-- nnoremap <C-b> :e#<CR> " behavior of C-^
vim.api.nvim_set_keymap('n', '<C-b>', ':e#<CR>', { noremap = true })

-- vnoremap < <gv
-- vnoremap > >gv
vim.api.nvim_set_keymap('v', '>', '>gv', { noremap = true })
vim.api.nvim_set_keymap('v', '<', '<gv', { noremap = true })

-- nnoremap zl 33zl
-- nnoremap zh 33zh
vim.api.nvim_set_keymap('n', 'zl', '33zl', { noremap = true })
vim.api.nvim_set_keymap('n', 'zh', '33zh', { noremap = true })

--  https://www.youtube.com/watch?v=hSHATqh8svM
--
--  keep cursor at the same place
-- nnoremap n nzzzv
-- nnoremap N Nzzzv
-- nnoremap J mzJ`z
vim.api.nvim_set_keymap('n', 'n', 'nzzzv', { noremap = true })
vim.api.nvim_set_keymap('n', 'N', 'Nzzzv', { noremap = true })
vim.api.nvim_set_keymap('n', 'J', 'mzJ`z', { noremap = true })

--  copy-to-the-end
--  nnoremap Y y$
--  v- to not capture cr-nl (:help g_)
--nnoremap Y yg_
vim.api.nvim_set_keymap('n', 'Y', 'yg_', { noremap = true })

--  undo breackpoints
vim.api.nvim_set_keymap('i', ',', ',<c-g>u', { noremap = true })
vim.api.nvim_set_keymap('i', '.', '.<c-g>u', { noremap = true })
vim.api.nvim_set_keymap('i', '!', '!<c-g>u', { noremap = true })
vim.api.nvim_set_keymap('i', '?', '?<c-g>u', { noremap = true })
vim.api.nvim_set_keymap('i', ';', ';<c-g>u', { noremap = true })
vim.api.nvim_set_keymap('i', '{', '{<c-g>u', { noremap = true })
vim.api.nvim_set_keymap('i', '[', '[<c-g>u', { noremap = true })
vim.api.nvim_set_keymap('i', '"', '"<c-g>u', { noremap = true })
vim.api.nvim_set_keymap('i', "'", "'<c-g>u", { noremap = true })

--nnoremap <S-Left> :vertical resize -3<CR>
--nnoremap <S-Right> :vertical resize +3<CR>
vim.api.nvim_set_keymap('n', '<S-Left>', ':vertical resize +3<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<S-Right>', ':vertical resize -3<CR>', { noremap = true })

-- :echom expand("%:h") . '/' . expand("%:t") . ':' . line(".")
-- nnoremap <C-c><C-p> :echom expand("%:p") . ':' . line(".") <CR>
--
--nnoremap <leader>cp :let @+=expand("%:p") . ':' . line(".") <CR>
vim.api.nvim_set_keymap('n', '<leader>fp', ':let @+=expand("%:p") . ":" . line(".")<cr>', { noremap = true, desc = 'Copy file path' })
--  ^-- `+` is the name of register

--  commented it because it prevent CTRL-I to work
--  noremap <Tab> gt
--  noremap <S-Tab> gT

--inoremap "" ""<Left>
--inoremap { {}<Left>
vim.api.nvim_set_keymap('i', '""', '""<Left>', { noremap = true })
vim.api.nvim_set_keymap('i', "''", "''<Left>", { noremap = true })
vim.api.nvim_set_keymap('i', '``', '``<Left>', { noremap = true })
vim.api.nvim_set_keymap('i', '<>', '<><Left>', { noremap = true })
vim.api.nvim_set_keymap('i', '[', '[]<Left>', { noremap = true })
vim.api.nvim_set_keymap('i', '(', '()<Left>', { noremap = true })
vim.api.nvim_set_keymap('i', '{', '{}<Left>', { noremap = true })

-- iabbrev cosnt const
-- iabbrev ocnst const
--
-- iabbrev ;r return
-- -- inoremap ;r return
-- inoremap ;f function
-- inoremap ;in instanceof
-- inoremap ;i import
-- inoremap ;if interface
-- inoremap ;tn throw new
-- inoremap ;q require
-- inoremap ;e export
-- inoremap ;a await
-- inoremap ;ud undefined
-- inoremap ;cs console
-- inoremap ;co constructor
-- inoremap ;c const
-- inoremap ;df default
-- inoremap ;x expect(
-- inoremap ;P Promise
--
-- inoremap ;st static
--
-- inoremap ;s struct
-- inoremap ;I Iterator
-- inoremap ;O Option
-- inoremap ;R Result
-- inoremap ;pn println!("
