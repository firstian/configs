local opt = vim.opt

opt.number = true
opt.relativenumber = true

opt.tabstop = 2
opt.softtabstop = 2
opt.shiftwidth = 2
opt.expandtab = true -- expand tab to spaces
opt.autoindent = true -- copy indent from current line when starting new one

opt.wrap = false

opt.showmode = false

opt.list = true
opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- Preview substitutions live, as you type!
opt.inccommand = 'split'

opt.confirm = true

-- search settings
opt.ignorecase = true -- ignore case when searching
opt.smartcase = true -- if you include mixed case in your search, assumes you want case-sensitive
opt.hlsearch = true -- only highlight the current match
opt.incsearch = true -- search as you type

-- cursor line
opt.cursorline = true -- highlight the current cursor line

opt.undodir = os.getenv 'HOME' .. '/.vim/undodir'
opt.undofile = true

opt.termguicolors = true
opt.scrolloff = 8
opt.signcolumn = 'yes'

-- backspace
opt.backspace = 'indent,eol,start' -- allow backspace on indent, end of line or insert mode start position

-- clipboard
opt.clipboard:append 'unnamedplus' -- use system clipboard as default register

-- split windows
opt.splitright = true -- split vertical window to the right
opt.splitbelow = true -- split horizontal window to the bottom

-- turn off swapfile
opt.swapfile = false

opt.isfname:append '@-@'

vim.g.netrw_liststyle = 3

-- custom global variable
vim.g.have_nerd_font = true

-- Disable netrw altogether to prevent flashing because neotree is lazily loaded.
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

opt.sessionoptions = 'blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions'
