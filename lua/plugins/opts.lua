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

return {
    { "dstein64/vim-startuptime", cmd = "StartupTime" },
    { "yianwillis/vimcdoc", event = "CmdLineEnter" },
    { "uga-rosa/ccc.nvim", cmd = { 'CccPick', 'CccHighlighterEnable' }, config = function () require('ccc').setup() end  },
    { "nvimdev/indentmini.nvim", config = M.config_indent },
    { "Mr-LLLLL/interestingwords.nvim", keys = { 'ff', 'FF' }, config = M.config_ff },
    { "terryma/vim-expand-region", config = M.config_vv },
    { "mg979/vim-visual-multi", event = 'CursorHold', init = M.init_mc },
    { "mzlogin/vim-markdown-toc", ft = 'markdown' },
    { "iamcco/markdown-preview.nvim", build = function() vim.fn["mkdp#util#install"]() end, cmd = 'MarkdownPreview', ft = 'markdown', config = M.config_mp },
}
