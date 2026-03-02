local M = {}

function M.init()
    vim.keymap.set('n', '<c-p>', function() require("fzf-lua").files({ cwd = os.getenv("PWD") }) end, { silent = true, noremap = true })
    vim.keymap.set('n', '<c-a>', function() require("fzf-lua").live_grep({ cwd = os.getenv("PWD") }) end, { silent = true, noremap = true })
    vim.keymap.set('n', '<c-b>', function() require("fzf-lua").buffers() end, { silent = true, noremap = true })
    vim.keymap.set('n', '<c-l>', function() require("fzf-lua").blines() end, { silent = true, noremap = true })
    vim.keymap.set('n', '<c-g>', function() require("fzf-lua").git_status({ cwd = os.getenv("PWD") }) end, { silent = true, noremap = true })
    vim.keymap.set('n', '<c-h>', function() require("fzf-lua").oldfiles({ cwd = os.getenv("PWD"), cwd_only = true }) end, { silent = true, noremap = true })
end

return { "ibhagwan/fzf-lua", dependencies = { "kyazdani42/nvim-web-devicons" }, init = M.init }
