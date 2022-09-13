local G = require('G')

function Toggle_venn()
    if G.b.venn_enabled ~= true then
        G.b.venn_enabled = true
        G.cmd[[setlocal ve=all]]
        G.api.nvim_buf_set_keymap(0, "n", "<c-up>", "<C-v>k:VBox<CR>", { noremap = true, silent = true })
        G.api.nvim_buf_set_keymap(0, "n", "<c-down>", "<C-v>j:VBox<CR>", { noremap = true, silent = true })
        G.api.nvim_buf_set_keymap(0, "n", "<c-left>", "<C-v>h:VBox<CR>", { noremap = true, silent = true })
        G.api.nvim_buf_set_keymap(0, "n", "<c-right>", "<C-v>l:VBox<CR>", { noremap = true, silent = true })
        G.api.nvim_buf_set_keymap(0, "v", "f", ":VBox<CR>", { noremap = true, silent = true })
        print("Venn mode enabled")
    else
        G.cmd[[setlocal ve=]]
        G.cmd[[mapclear <buffer>]]
        G.b.venn_enabled = nil
        print("Venn mode disabled")
    end
end
G.map({ { 'n', 'M', ":lua Toggle_venn()<CR>", { noremap = true, silent = true } } })
