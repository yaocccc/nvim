local G = require('G')
local M = {}

-- 有时候进入到依赖文件内，此时想在依赖文件所在目录查看文件 nvim-tree 并没有一个很好的方法，所以写了这个func
-- 使用 如果当前编辑文件不在目录内（或在ignore内），go会切换到目录内，再次go回到项目目录
local inner_cwd = ""
local outer_cwd = ""
function M.magicCd()
    local api = require("nvim-tree.api")
    local core = require("nvim-tree.core")

    local file_path = G.fn.expand('#:p:h')
    local tree_cwd = core.get_cwd()

    if inner_cwd == "" then
        inner_cwd = tree_cwd
    end

    -- 树在内部目录 且 当前文件为外部文件 则切换到外部目录
    if tree_cwd == inner_cwd and string.find(file_path, '^' .. inner_cwd) == nil then
        inner_cwd = tree_cwd
        outer_cwd = file_path
        return api.tree.change_root(file_path)
    end

    -- 树在内部目录 且 当前文件为内部文件 则切换到外部目录（如果有的话）
    if tree_cwd == inner_cwd and string.find(file_path, '^' .. inner_cwd) ~= nil then
        if outer_cwd ~= "" then
            return api.tree.change_root(outer_cwd)
        end
    end

    -- 树在外部目录 且 当前文件为外部文件 则切换到内部目录
    if tree_cwd ~= inner_cwd and string.find(file_path, '^' .. outer_cwd) ~= nil then
        return api.tree.change_root(inner_cwd)
    end

    -- 树在外部目录 且 当前文件为内部文件 则切换到内部目录
    if tree_cwd ~= inner_cwd and string.find(file_path, '^' .. inner_cwd) ~= nil then
        return api.tree.change_root(inner_cwd)
    end
end

function M.config()
    G.g.nvim_tree_firsttime = 1
    G.map({ { 'n', 'T', 'g:nvim_tree_firsttime != 1 ? ":NvimTreeToggle<cr>" : ":let g:nvim_tree_firsttime = 0<cr>:NvimTreeToggle $PWD<cr>"', {silent = true, noremap = true, expr = true}} })
    G.cmd("hi! NvimTreeCursorLine cterm=NONE ctermbg=238")
    G.cmd("hi! link NvimTreeFolderIcon NvimTreeFolderName")
    G.cmd("au FileType NvimTree nnoremap <buffer> <silent> go :lua require('pack.nvim-tree').magicCd()<cr>")
end

function M.setup()
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
                    local columns = G.o.columns
                    local lines = G.o.lines
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

return M
