vim.g.python3_host_prog = os.getenv('PYTHON') -- export PYTHON=$(which python3)
vim.g.editorconfig = false
vim.opt.termguicolors = true
vim.opt.showcmd = true
vim.opt.encoding = 'utf-8'
vim.opt.wildmenu = true
vim.opt.pumheight = 10
vim.opt.conceallevel = 0
vim.opt.clipboard = 'unnamed,unnamedplus'
vim.opt.hlsearch = true
vim.opt.showmatch = true
vim.opt.incsearch = true
vim.opt.inccommand = ''
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.timeoutlen = 400
vim.opt.backspace = 'indent,eol,start'
vim.opt.whichwrap = 'b,s,<,>,h,'
vim.opt.mouse = 'a'
vim.opt.vb = true
vim.opt.hidden = true
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.smarttab = true
vim.opt.expandtab = true
vim.opt.backup = false
vim.opt.swapfile = false
vim.opt.wrap = false
vim.opt.undofile = true
vim.opt.undodir = vim.fn.stdpath('config') .. '/cache/undodir'
vim.opt.viminfo = "!,'10000,<50,s10,h"
vim.opt.foldenable = true
vim.opt.foldmethod = 'manual'
vim.opt.viewdir = vim.fn.stdpath('config') .. '/cache/viewdir'
vim.opt.foldtext = 'v:lua.MagicFoldText()' -- 方法的定义在 lua/keymap.lua 中
vim.opt.cmdheight = 1
vim.opt.updatetime = 300
vim.opt.shortmess = 'filnxtToOcIF'
vim.opt.scrolloff = 5
vim.opt.showmode = false
vim.opt.number = true
vim.opt.numberwidth = 2
vim.opt.cul = true
vim.opt.signcolumn = 'yes'
vim.opt.fillchars = 'fold:-,stlnc:#,eob: ,foldsep:='

vim.cmd([[
    hi Normal ctermfg=7 guifg=#c0c0c0 ctermbg=NONE cterm=NONE
    colorscheme solarized8_high
    let &t_SI .= '\e[5 q'
    let &t_EI .= '\e[1 q'
    let &t_vb = ''
    let &t_ut = ''
]])
