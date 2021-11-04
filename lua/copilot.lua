vim.g.copilot_no_tab_map = true
vim.api.nvim_command('imap <silent><script><expr> <c-j> copilot#Accept("\\<CR>")')
