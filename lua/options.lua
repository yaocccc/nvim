require('ui/highlights')  -- 配色
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
vim.opt.foldtext = 'MagicFoldText()'

-- 以下是全局的autocmd
vim.api.nvim_create_autocmd({ "BufEnter" }, { command = [[if &buftype == '' && &readonly == 1 | set buftype=acwrite | set noreadonly | endif]] })
vim.api.nvim_create_autocmd({ "BufReadPost" }, { command = [[if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif]] })
vim.api.nvim_create_autocmd({ "FileType" }, { command = "try | silent! loadview | catch | endtry" })
vim.api.nvim_create_autocmd({ "BufLeave", "BufWinLeave" }, { command = "silent! mkview" })
vim.api.nvim_create_autocmd({ "InsertEnter" }, { command = "hi CursorLine ctermbg=235 guibg=#262626" })
vim.api.nvim_create_autocmd({ "InsertLeave" }, { command = "hi CursorLine ctermbg=none guibg=none" })

-- 展示FoldText的方法
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
