local G = require('G')
local M = {}

function M.init_echo()
    G.map({ { 'v', 'C', ':<c-u>VECHO<cr>', {silent = true, noremap = true}} })
    vim.g.vim_echo_by_file = {
        js = 'console.log([ECHO])',
        ts = 'console.log([ECHO])',
        vue = 'console.log([ECHO])',
    }
end

function M.init_comment()
    vim.g.vim_line_comments = {
        vim = '"',
        vimrc = '"',
        js = '//',
        ts = '//',
        java = '//',
        class = '//',
        c = '//',
        h = '//',
        go = '//',
        lua = '--',
        proto = '//',
        ['go.mod'] = '//',
        md = '[^_^]:',
        vue = '//',
        sql = '--',
        sol = '//',
    }
    vim.g.vim_chunk_comments = {
        js = {'/**', ' *', ' */'},
        ts = {'/**', ' *', ' */'},
        sh = {':<<!', '', '!'},
        proto = {'/**', ' *', ' */'},
        md = {'[^_^]:', '    ', ''},
        vue = {'/**', ' *', ' */'},
        sol = {'/**', ' *', ' */'},
    }
    G.map({
        { 'n', '??', ':NToggleComment<cr>', {silent = true, noremap = true}},
        { 'v', '/', ':<c-u>VToggleComment<cr>', {silent = true, noremap = true}},
        { 'v', '?', ':<c-u>CToggleComment<cr>', {silent = true, noremap = true}},
    })
end

function M.init_foldsign() require("nvim-foldsign").setup() end

function GitInfo()
    local branch = vim.g.coc_git_status or ''
    local diff = vim.b.coc_git_status or ''
    return (string.len(branch) > 0 and string.format(" %s ", branch) or " none ") .. (string.len(diff) > 0 and string.format('%s ', vim.fn.trim(diff)) or '')
end

function CocErrCount()
    local coc_diagnostic_info = vim.b.coc_diagnostic_info or { error = 0 }
    return string.format(' E%d ', coc_diagnostic_info.error)
end

function GetFt()
    local name = vim.api.nvim_eval("expand('%:p')")
    local ft = vim.api.nvim_eval('&ft')
    local icon = require('nvim-lines.common').get_fileicon(ft, name)
    return string.format(' %s ', string.len(ft) > 0 and icon .. ft or '~')
end

function M.init_line()
    vim.g.powerline_symbols = { light_right = '', dark_right = '', light_left = '', dark_left = '' }
    vim.g.line_powerline_enable = 1
    vim.g.line_nerdfont_enable = 1
    vim.g.line_unnamed_filename = '~'
    vim.g.line_statusline_getters = {'v:lua.GitInfo', 'v:lua.CocErrCount', 'v:lua.GetFt'}
    vim.g.line_hl = { none = 'NONE', light = 'NONE', dark = 'NONE', ['break'] = '244', space = 238 }
    vim.cmd('au VimEnter * hi VimLine_Dark ctermfg=245 guifg=#8a8a8a')
    vim.cmd('au VimEnter * hi VimLine_Buf_Dark ctermfg=245 guifg=#8a8a8a')
    vim.cmd('au VimEnter * hi VimLine_Other ctermfg=245 guifg=#8a8a8a')
end

return {
    { "yaocccc/vim-comment", cmd = { "NToggleComment", "VToggleComment", "CToggleComment" }, init = M.init_comment },
    { "yaocccc/vim-echo", cmd = "VECHO", init = M.init_echo },
    { "yaocccc/nvim-foldsign", event = 'CursorHold', init = M.init_foldsign },
    { "yaocccc/nvim-lines.lua", init = M.init_line },
    { "yaocccc/vim-surround", event = 'ModeChanged' },
    { "yaocccc/vim-fcitx2en", event = 'InsertLeavePre' },
}
