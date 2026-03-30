local M = {}

function GitInfo()
    local branch = vim.b.gitsigns_head or ''
    local diff = vim.b.gitsigns_status or ''
    return (string.len(branch) > 0 and string.format(" %s ", branch) or " none ") .. (string.len(diff) > 0 and string.format('%s ', vim.fn.trim(diff)) or '')
end

function ErrCount()
    local diagnostics = vim.diagnostic.count(0, { severity = vim.diagnostic.severity.ERROR })
    return string.format('  err=%d  ', diagnostics[vim.diagnostic.severity.ERROR] or 0)
end

function GetFt()
    local name = vim.api.nvim_eval("expand('%:p')")
    local ft = vim.api.nvim_eval('&ft')
    local icon = require('nvim-lines.common').get_fileicon(ft, name)
    return string.format(' %s ', string.len(ft) > 0 and icon .. ft or '~')
end

function M.init_line()
    vim.g.powerline_symbols = { light_right = '', dark_right = '', light_left = '', dark_left = '' }
    vim.g.line_powerline_enable = 1
    vim.g.line_nerdfont_enable = 1
    vim.g.line_unnamed_filename = '~'
    vim.g.line_statusline_getters = { 'v:lua.GitInfo', 'v:lua.ErrCount', 'v:lua.GetFt' }
    vim.g.line_hl = { none = 'NONE', light = 'NONE', dark = 'NONE', ['break'] = '244', space = 238 }
    vim.cmd('au VimEnter * hi VimLine_Dark ctermfg=245 guifg=#8a8a8a')
    vim.cmd('au VimEnter * hi VimLine_Buf_Dark ctermfg=245 guifg=#8a8a8a')
    vim.cmd('au VimEnter * hi VimLine_Other ctermfg=245 guifg=#8a8a8a')
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
        ["I Return"] = '',
        ["I Up Arrow"] = '',
        ["I Down Arrow"] = '',
        ["I Left Arrow"] = '',
        ["I Right Arrow"] = '',
    }
end

function M.init_comment()
    vim.g.vim_line_comments = {
        vim = '"', vimrc = '"',
        js = '//', ts = '//', java = '//', class = '//', c = '//', h = '//', go = '//', proto = '//', ['go.mod'] = '//', vue = '//', sol = '//',
        lua = '--', sql = '--', md = '[^_^]:',
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
    vim.keymap.set('n', '??', ':NToggleComment<cr>', { silent = true, noremap = true })
    vim.keymap.set('v', '/', ':<c-u>VToggleComment<cr>', { silent = true, noremap = true })
    vim.keymap.set('v', '?', ':<c-u>CToggleComment<cr>', { silent = true, noremap = true })
end

function M.init_echo()
    local tmp = 'console.log([ECHO])'
    vim.keymap.set('v', 'C', ':<c-u>VECHO<cr>', { silent = true, noremap = true })
    vim.g.vim_echo_by_file = { js = tmp, ts = tmp, vue = tmp }
end

function M.init_mp()
    vim.g.mkdp_preview_options = { hide_yaml_meta = 1, disable_filename = 1 }
    vim.g.vmt_fence_text = 'markdown-toc'
end

function M.config_iw()
    local iw = require("interestingwords")
    iw.setup({
        colors = { '#aeee55', '#aa5522', '#225488', '#088823', '#eed724', '#bb3c7b', '#5478c0', '#047a89', '#a84247', '#ccf2e5' },
        search_count = false,
        navigation = true,
        scroll_center = true,
        color_key = "ff",
        cancel_color_key = "FF",
    })
    -- 自行搜索时，取消所有高亮
    vim.api.nvim_create_autocmd("CmdlineEnter", { pattern = {"/", "?" }, callback = function() iw.UncolorAllWords(false) end })
end

return {
    { "dstein64/vim-startuptime", cmd = "StartupTime" },
    { "yianwillis/vimcdoc", event = "CmdLineEnter" },
    { "uga-rosa/ccc.nvim", cmd = { 'CccPick', 'CccHighlighterEnable' }, opts = {} },
    { "Mr-LLLLL/interestingwords.nvim", keys = { 'ff', 'FF' }, config = M.config_iw },
    { "mg979/vim-visual-multi", event = 'CursorHold', init = M.init_mc },
    { "yaocccc/nvim-lines.lua", init = M.init_line },
    { "yaocccc/vim-comment", cmd = { "NToggleComment", "VToggleComment", "CToggleComment" }, init = M.init_comment },
    { "yaocccc/nvim-foldsign", event = 'CursorHold', opts = { foldsigns = { open = '', close = '', seps = { '│', '┃' } } } },
    { "yaocccc/vim-surround", event = 'ModeChanged' },
    { "yaocccc/vim-fcitx2en", event = 'InsertLeavePre' },
    { "yaocccc/vim-echo", cmd = "VECHO", init = M.init_echo },
    { "iamcco/markdown-preview.nvim", build = "cd app && npm install", ft = 'markdown', init = M.init_mp },
    {
        'MeanderingProgrammer/render-markdown.nvim',
        dependencies = { 'nvim-treesitter/nvim-treesitter' },
        init = function() vim.keymap.set('n', '<F6>', ':RenderMarkdown toggle<cr>', { silent = true, noremap = true }) end,
        opts = {
            code = { width = 'block', render_modes = true, right_pad = 1, border = 'thin', style = 'normal' },
            sign = { enabled = false },
            checkbox = { enabled = false },
            bullet = { enabled = false },
        },
    },
    {
        "terryma/vim-expand-region",
        init = function()
            vim.keymap.set('v', 'v', '<Plug>(expand_region_expand)', { silent = true })
            vim.keymap.set('v', 'V', '<Plug>(expand_region_shrink)', { silent = true })
        end
    },
    {
        "nvimdev/indentmini.nvim",
        opts = { only_current = false, exclude = { 'markdown', 'help', 'text', 'rst' } },
        event = 'BufReadPre',
        init = function()
            vim.api.nvim_set_hl(0, 'IndentLine', { fg = '#3c3c3c' })
            vim.api.nvim_set_hl(0, 'IndentLineCurrent', { fg = '#3a4f6a' })
        end
    },
    {
        -- "acidsugarx/babel.nvim",
        "yaocccc/babel.nvim",
        version = "*",
        config = M.config_tt,
        keys = { 'mm' },
        opts = { target = "zh", display = "float", keymaps = { translate = "mm", translate_word = "mm" }, float = { nvim_open_win = { relative = "cursor", row = 1, col = 0, anchor = "NW", border = "single", title = "" }, max_width = 50, max_height = 10 } }
    },
    {
        "folke/flash.nvim",
        event = "VeryLazy",
        opts = { jump = { autojump = true, register = true }, modes = { char = { enabled = false } } },
        init = function()
            vim.api.nvim_set_hl(0, 'FlashBackdrop', { fg = '#6e6e6e' })
            vim.api.nvim_set_hl(0, 'FlashLabel', { fg = '#ff007c', bold = true })
            vim.api.nvim_set_hl(0, 'FlashMatch', { fg = '#5fd7ff', underline = true })
            vim.api.nvim_set_hl(0, 'FlashCurrent', { fg = '#ffd700', bold = true })
        end,
        keys = {
            { "f", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
        },
    }
}
