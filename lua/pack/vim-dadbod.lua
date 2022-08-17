local G = require('G')
G.g.db_ui_save_location = '~/.config/zsh/cache'
G.g.db_ui_use_nerd_fonts = 1
G.g.db_ui_force_echo_notifications = 1
G.g.db_ui_table_helpers = {
    mysql = {
        ['List'] = 'SELECT * from `{schema}`.`{table}` LIMIT 100;',
        ['Indexes'] = 'SHOW INDEXES FROM `{schema}`.`{table}`;',
        ['Table Fields'] = 'DESCRIBE `{schema}`.`{table}`;',
        ['Alter Table'] = 'ALTER TABLE `{schema}`.`{table}` ADD '
    }
}
function DBUI()
    G.cmd('set laststatus=0 showtabline=0 nonu signcolumn=no nofoldenable')
    G.cmd('exec "DBUI"')
end
G.cmd('com! CALLDB call v:lua.DBUI()')
