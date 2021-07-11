vim.g.db_ui_save_location = '~/.config/zsh/cache'
vim.g.db_ui_use_nerd_fonts = 1
vim.g.db_ui_force_echo_notifications = 1
vim.g.db_ui_table_helpers = {
    mysql = {
        ['List'] = 'SELECT * from `{schema}`.`{table}` LIMIT 100;',
        ['Indexes'] = 'SHOW INDEXES FROM `{schema}`.`{table}`;',
        ['Table Fields'] = 'DESCRIBE `{schema}`.`{table}`;',
        ['Alter Table'] = 'ALTER TABLE `{schema}`.`{table}` ADD '
    }
}

vim.api.nvim_command('com! CALLDB call v:lua.DBUI()')
function DBUI()
    vim.api.nvim_command('set laststatus=0 showtabline=0 nonu signcolumn=no nofoldenable')
    vim.api.nvim_command('exec "DBUI"')
end
