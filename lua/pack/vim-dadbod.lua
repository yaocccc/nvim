local G = require('G')
local M = {}

function M.DBUI()
    G.cmd('set laststatus=0 showtabline=0 nonu signcolumn=no nofoldenable')
    G.cmd('exec "DBUI"')
end

function M.config()
    G.g.db_ui_save_location = '~/.cache'
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
    G.cmd('com! CALLDB lua require("pack/vim-dadbod").DBUI()')
end

function M.setup()
    -- do nothing
end

return M
