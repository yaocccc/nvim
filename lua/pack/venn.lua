local vim = vim
local G = require('G')
local M = {}

function _G.Toggle_venn(want_close)
    local venn_enabled = vim.inspect(vim.b.venn_enabled)
    if want_close == 1 and venn_enabled == "nil" then return end
    if venn_enabled == "nil" then
        G.map({
            { "n", "<up>", "<C-v>k:VBox<CR>", {noremap = true} },
            { "n", "<down>", "<C-v>j:VBox<CR>", {noremap = true} },
            { "n", "<left>", "<C-v>h:VBox<CR>", {noremap = true} },
            { "n", "<right>", "<C-v>l:VBox<CR>", {noremap = true} },
        })
        vim.cmd[[setlocal ve=all]]
        vim.b.venn_enabled = true
        print("venn enabled")
    else
        G.map({
            { "n", "<up>", "<up>", {noremap = true} },
            { "n", "<down>", "<down>", {noremap = true} },
            { "n", "<left>", "<left>", {noremap = true} },
            { "n", "<right>", "<right>", {noremap = true} },
        })
        vim.cmd[[setlocal ve=]]
        vim.b.venn_enabled = nil
        print("venn closed")
    end
end

function M.config()
    G.map({
        { 'v', '<space>', ':VBox<cr>', { noremap = true, silent = true } },
        { 'n', 'M', ":lua Toggle_venn(0)<CR>", { noremap = true, silent = true } },
        { 'n', '<esc>', ":lua Toggle_venn(1)<CR><esc>", { noremap = true, silent = true } }
    })
end

function M.setup()
end

return M
