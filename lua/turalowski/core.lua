local opt = vim.opt

-- Line numbers
opt.number = true -- set numbered lines
opt.relativenumber = true -- set relative numbered lines

-- tabs & identation
opt.tabstop = 2
opt.shiftwidth = 2 -- the number of spaces inserted for each identation
opt.expandtab = true -- covnert tabs to spaces
opt.autoindent = true

-- line wrapping
-- opt.wrap = false -- display lines as one long line

-- search settings
opt.ignorecase = true -- ignore case in search patterns
opt.smartcase = true -- smart case

-- cursor line
opt.cursorline = true -- highlight the current line

-- appearance
opt.termguicolors = true
opt.signcolumn = "yes" -- always show the sign column, otherwise it would shift the text each time

-- backspace
opt.backspace = "indent,eol,start"

-- clipboard
opt.clipboard = "unnamedplus" -- allows neovim to access the system clipboard

-- split windows
opt.splitbelow = true -- force all horizontal splits to go bellow instead of above
opt.splitright = true -- force all vertical splits to go to the right of current window

-- Specify selection
opt.iskeyword:append("-") -- Vim will realize words with - as a single one

opt.swapfile = false
opt.backup = false
opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
opt.undofile = true

-- complex searchs
opt.hlsearch = false
opt.incsearch = true

opt.scrolloff = 8
opt.signcolumn = "yes"
opt.isfname:append("@-@")

opt.updatetime = 50

vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
