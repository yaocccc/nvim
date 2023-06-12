local G = require('G')
local M = {}

function M.config()
    -- vim-echo
    G.map({
        { 'v', 'C', ':<c-u>VECHO<cr>', {silent = true, noremap = true}},
    })
    G.g.vim_echo_by_file = {
        js = 'console.log([ECHO])',
        ts = 'console.log([ECHO])',
        vue = 'console.log([ECHO])',
    }

    -- hl-chunk
    G.g.hlchunk_files = '*.ts,*.js,*.json,*.go,*.c,*.cpp,*.rs,*.h,*.hpp,*.lua,*.vue'

    -- vim-comment
    G.g.vim_line_comments = {
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
    G.g.vim_chunk_comments = {
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

function M.setup()
    -- do nothing
end

return M
