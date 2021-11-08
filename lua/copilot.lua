vim.g.copilot_no_tab_map = true
vim.api.nvim_command('imap <silent><script><expr> <Right> copilot#Accept("\\<Right>")')
