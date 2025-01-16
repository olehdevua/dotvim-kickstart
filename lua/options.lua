-- :help vim.opt
-- :help option-list

-- Enable break indent
-- vim.opt.breakindent = true

-- Save undo history
-- vim.opt.undofile = true

-- default text encoding
vim.opt.encoding = 'utf-8'
vim.opt.termguicolors = true -- set term gui colors (most terminals support this)

vim.opt.title = true
vim.opt.showcmd = true
vim.opt.number = true -- also vim.opt.relativenumber
vim.opt.autoread = true -- For auto update files
vim.opt.wildmenu = true
vim.opt.showmatch = true -- highlight matching brace  (set sm)
vim.opt.smartcase = true -- smart-case search
vim.opt.ignorecase = true -- ignore registre while searching (set ic)
vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.showmode = false -- don't show the mode, since it's already in the status line

vim.opt.splitbelow = true -- force all horizontal splits to go below current window
vim.opt.splitright = true -- force all vertical splits to go to the right of current window

vim.cmd 'hi Comment cterm=italic'

-- Sync clipboard between OS and Neovim.
--  Schedule the setting after `UiEnter` because it can increase startup-time.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.schedule(function()
  vim.opt.clipboard = 'unnamedplus'
end)
-- v- mine
--
-- set clipboard+=unnamedplus
-- "set formatoptions-=cro " stop newline continution of comments (for now have no clue what does it means)
-- vim.o.clipboard = 'unnamedplus'

vim.opt.pumheight = 13 -- height of popup menu

-- " https://habr.com/ru/post/64224/
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.smarttab = true
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.tabstop = 2
vim.opt.expandtab = true -- transformation tab into spaces
vim.opt.wrap = false

vim.o.cursorline = true

-- highlight <word> when you do ':%s/<word>/..'
vim.opt.inccommand = 'nosplit' -- nosplit is default (can be 'split')

vim.opt.ruler = true -- Show row and column ruler information
vim.opt.showtabline = 2 -- Show tab bar
vim.opt.undolevels = 256 -- Number of undo levels
-- Backspace behaviour
vim.opt.backspace = 'indent,eol,start'

-- by default `foldlevel` is 0, that is everything is
-- folded, so you can to disable it initially
--
-- set nofoldenable
vim.opt.foldmethod = 'indent'
--
-- fold everything below layer 3
vim.opt.foldlevelstart = 3
--
vim.cmd 'hi Folded ctermbg=230'

vim.opt.mouse = 'a'

-- if has ("autocmd")
--     filetype indent on
-- endif

-- set tags=tags;/,rusty-tags.vi

-- Performance
vim.opt.synmaxcol = 512
vim.opt.lazyredraw = true -- to avoid scrolling problems

-- :help 'list' and :help 'listchars'
vim.opt.list = true
-- vim.o.listchars = "tab:·\ " -- mine
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' } -- kickstart

vim.opt.scrolloff = 14
vim.opt.scrolljump = 14
vim.opt.sidescrolloff = 36

-- change sp window   map <Tab> <C-W>W:cd %:p:h<CR>:<CR>

-- session options
vim.opt.sessionoptions = 'curdir,buffers,tabpages'
-- don't unload a buffe, when we are switching to another one.
-- this allows edit several files at the same time without necessity
-- to save every time we switch Не выгружать буфер
--" Не выгружать буфер, когда переключаемся на другой. Это позволяет редактировать
--" несколько файлов в один и тот же момент без необходимости сохранения каждый раз
--" когда переключаешься между ними
vim.opt.hidden = true

--" set backupdir=~/.vim/backup//
--" set directory=~/.vim/swap//
vim.opt.backup = false
vim.opt.writebackup = false
-- disable creating swap files
vim.opt.swapfile = false
--"
-- Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
-- delays and poor user experience. (AFAIU better to disable swap files).
-- btw: gives faster completion (4000ms default)
vim.opt.updatetime = 200
-- time to wait for a mapped sequence to complete (in milliseconds)
-- didnt completely understood its meaning
vim.opt.timeoutlen = 400
-- vim.o.ttimeoutlen = 0 -- hz wo eto, razberis

-- " set signcolumn=auto:2 " or number ?
-- v-- or number ?
vim.opt.signcolumn = 'yes:2'
-- vim.opt.signcolumn = 'yes' -- kickstart

--" give more space for displaying messages
vim.opt.cmdheight = 2

--" single status line for all windows
vim.opt.laststatus = 3
