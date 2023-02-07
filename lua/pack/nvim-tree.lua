local G = require('G')
local M = {}

-- 有时候进入到依赖文件内，此时想在依赖文件所在目录查看文件 nvim-tree 并没有一个很好的方法，所以写了这个func
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
    G.cmd("au FileType NvimTree nnoremap <buffer> <silent> C :lua require('pack.nvim-tree').magicCd()<cr>")
end

function M.setup()
    local nvim_tree = require("nvim-tree")
    nvim_tree.setup({
        sort_by = "case_sensitive",
        actions = {
            open_file = {
                window_picker = { enable = false }
            }
        },
        view = {
            mappings = {
                list = {
                    { key = "P", action = "cd" },
                    { key = "<BS>", action = "dir_up" },
                    { key = "<Esc>", action = "close" },
                    { key = "<Tab>", action = "expand" },
                    { key = "<Right>", action = "expand" },
                    { key = "<Left>", action = "close_node" },
                    { key = ")", action = "next_git_item" },
                    { key = "(", action = "prev_git_item" },
                    { key = ">", action = "next_diag_item" },
                    { key = "<", action = "prev_diag_item" },
                    { key = "?", action = "toggle_help" },
                    { key = "A", action = "create" },
                    { key = "C", action = "" },
                },
            },
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
