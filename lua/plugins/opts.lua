local G = require('G')
local M = {}

function M.config_indent()
    G.hi({
        IndentLine = { fg = '#3c3c3c' },
        IndentLineCurrent = { fg = '#3a4f6a' },
    })
    require("indentmini").setup({ only_current = false })
end

function M.config_ff()
    require("interestingwords").setup {
        colors = { '#aeee55', '#aa5522', '#225488', '#088823', '#eed724', '#bb3c7b', '#5478c0', '#047a89', '#a84247', '#ccf2e5' },
        search_count = false,
        navigation = false,
        scroll_center = true,
        color_key = "ff",
        cancel_color_key = "FF",
        select_mode = "random",  -- random or loop
    }
end

function M.config_vv()
    G.map({
        { 'v', 'v', '<Plug>(expand_region_expand)', {silent = true}},
        { 'v', 'V', '<Plug>(expand_region_shrink)', {silent = true}},
    })
end

function M.config_mp()
    vim.g.mkdp_markdown_css = '/home/chenyc/.config/nvim/colors/markdown.css'
    vim.g.mkdp_page_title = '${name}'
    vim.g.mkdp_preview_options = { hide_yaml_meta = 1, disable_filename = 1 }
    vim.g.vmt_fence_text = 'markdown-toc'
end

function M.init_mc()
    vim.g.VM_theme = 'ocean'
    vim.g.VM_highlight_matches = 'underline'
    vim.g.VM_maps = {
        ['Find Under'] = '<C-n>',
        ['Find Subword Under'] = '<C-n>',
        ['Select All'] = '<C-d>',
        ['Select h'] = '<C-Left>',
        ['Select l'] = '<C-Right>',
        ['Add Cursor Up'] = '<C-Up>',
        ['Add Cursor Down'] = '<C-Down>',
        ['Add Cursor At Pos'] = '<C-x>',
        ['Add Cursor At Word'] = '<C-w>',
        ['Move Left'] = '<C-S-Left>',
        ['Move Right'] = '<C-S-Right>',
        ['Remove Region'] = 'q',
        ['Increase'] = '+',
        ['Decrease'] = '_',
        ["Undo"] = 'u',
        ["Redo"] = '<C-r>',
    }
end

function M.config_tt ()
    require("babel").setup({
        keymaps = {
            translate = "mm",
            translate_word = "mm",
        },
    })
end

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
    { "dstein64/vim-startuptime", cmd = "StartupTime" },
    { "yianwillis/vimcdoc", event = "CmdLineEnter" },
    { "uga-rosa/ccc.nvim", cmd = { 'CccPick', 'CccHighlighterEnable' }, config = function () require('ccc').setup() end  },
    { "nvimdev/indentmini.nvim", config = M.config_indent },
    { "Mr-LLLLL/interestingwords.nvim", keys = { 'ff', 'FF' }, config = M.config_ff },
    { "terryma/vim-expand-region", config = M.config_vv },
    { "mg979/vim-visual-multi", event = 'CursorHold', init = M.init_mc },
    { "mzlogin/vim-markdown-toc", ft = 'markdown' },
    { "iamcco/markdown-preview.nvim", build = function() vim.fn["mkdp#util#install"]() end, ft = 'markdown', config = M.config_mp },
    { "yaocccc/nvim-lines.lua", init = M.init_line },
    { "yaocccc/vim-comment", cmd = { "NToggleComment", "VToggleComment", "CToggleComment" }, init = M.init_comment },
    { "yaocccc/vim-echo", cmd = "VECHO", init = M.init_echo },
    { "yaocccc/nvim-foldsign", event = 'CursorHold', opts = {} },
    { "yaocccc/vim-surround", event = 'ModeChanged' },
    { "yaocccc/vim-fcitx2en", event = 'InsertLeavePre' },
    { "yaocccc/babel.nvim", version = "*", config = M.config_tt },
}
