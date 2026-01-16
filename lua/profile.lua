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
vim.opt.undodir = os.getenv('HOME') .. '/.config/nvim/cache/undodir'
vim.opt.viminfo = "!,'10000,<50,s10,h"
vim.opt.foldenable = true
vim.opt.foldmethod = 'manual'
vim.opt.viewdir = os.getenv('HOME') .. '/.config/nvim/cache/viewdir'
vim.opt.foldtext = 'v:lua.MagicFoldText()'
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

function MagicFoldText()
    local spacetext = ("        "):sub(0, vim.opt.shiftwidth:get())
    local line = vim.fn.getline(vim.v.foldstart):gsub("\t", spacetext)
    local folded = vim.v.foldend - vim.v.foldstart + 1
    local findresult = line:find('%S')
    if not findresult then return '+ folded ' .. folded .. ' lines ' end
    local empty = findresult - 1
    local funcs = {
        [0] = function(_) return '' .. line end,
        [1] = function(_) return '+' .. line:sub(2) end,
        [2] = function(_) return '+ ' .. line:sub(3) end,
        [-1] = function(c)
            local result = ' ' .. line:sub(c + 1)
            local foldednumlen = #tostring(folded)
            for _ = 1, c - 2 - foldednumlen do result = '-' .. result end
            return '+' .. folded .. result
        end,
    }
    return funcs[empty <= 2 and empty or -1](empty) .. ' folded ' .. folded .. ' lines '
end
