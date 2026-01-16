local G = require('G')
local M = {}

function M.init()
    vim.g.nvim_tree_firsttime = 1
    G.map({ { 'n', 'T', 'g:nvim_tree_firsttime != 1 ? ":NvimTreeToggle<cr>" : ":let g:nvim_tree_firsttime = 0<cr>:NvimTreeToggle $PWD<cr>"', {silent = true, noremap = true, expr = true}} })
    vim.cmd("hi! NvimTreeCursorLine cterm=NONE ctermbg=238 guibg=#444444")
    vim.cmd("hi! link NvimTreeFolderIcon NvimTreeFolderName")
end

function M.cofig()
    local nvim_tree = require("nvim-tree")

    local function on_attach(bufnr)
        local api = require("nvim-tree.api")
        local function opts(desc)
            return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
        end

        api.config.mappings.default_on_attach(bufnr)
        vim.keymap.set('n', 'P', api.tree.change_root_to_node, opts('CD'))
        vim.keymap.set('n', '<BS>', api.tree.change_root_to_parent, opts('Up'))
        vim.keymap.set('n', '<Esc>', api.tree.close, opts('Close'))
        vim.keymap.set('n', '<Left>', api.node.navigate.parent_close, opts('Close Directory'))
        vim.keymap.set('n', '<Right>', api.node.open.edit, opts('Open'))
        vim.keymap.set('n', '<CR>',  api.node.open.edit, opts('Open'))
        vim.keymap.set('n', ')', api.node.navigate.git.next, opts('Next Git'))
        vim.keymap.set('n', '(', api.node.navigate.git.prev, opts('Prev Git'))
        vim.keymap.set('n', '>', api.node.navigate.diagnostics.next, opts('Next Diagnostic'))
        vim.keymap.set('n', '<', api.node.navigate.diagnostics.prev, opts('Prev Diagnostic'))
        vim.keymap.set('n', '?', api.tree.toggle_help, opts('Help'))
        vim.keymap.set('n', 'A', api.fs.create, opts('Create'))
        vim.keymap.set('n', 'a', api.fs.create, opts('Create'))
        vim.keymap.set('n', 'r', api.fs.rename, opts('Rename'))
    end

    nvim_tree.setup({
        on_attach = on_attach,
        sort_by = "case_sensitive",
        actions = {
            open_file = {
                window_picker = { enable = false }
            }
        },
        view = {
            float = {
                enable = true,
                open_win_config = function()
                    local columns = vim.o.columns
                    local lines = vim.o.lines
                    local width = math.max(math.floor(columns * 0.5), 50)
                    local height = math.max(math.floor(lines * 0.5), 20)
                    local left = math.ceil((columns - width) * 0.5)
                    local top = math.ceil((lines - height) * 0.5 - 2)
                    return { relative = "editor", border = "rounded", width = width, height = height, row = top, col = left }
                end,
            }
        },
        update_focused_file = {
            enable = true,
            update_root = false,
            ignore_list = {},
        },
        renderer = {
            group_empty = true,
            indent_markers = { enable = true },
            icons = {
                git_placement = "after", webdev_colors = true,
                glyphs = {
                    git = { unstaged = "~", staged = "✓", unmerged = "", renamed = "+", untracked = "?", deleted = "", ignored = " " },
                    folder = { empty = "", empty_open = "" }
                }
            }
        },
        filters = { dotfiles = true },
        diagnostics = {
            enable = true, show_on_dirs = true, debounce_delay = 50,
            icons = { hint = "", info = "", warning = "", error = "" }
        },
    })
end

return {
    { "kyazdani42/nvim-web-devicons" },
    {
        "kyazdani42/nvim-tree.lua",
        cmd = { 'NvimTreeToggle', 'NvimTreeFindFileToggle' },
        dependencies = { "kyazdani42/nvim-web-devicons" },
        init = M.init,
        config = M.cofig
    }
}
