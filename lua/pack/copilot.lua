local G = require('G')
local M = {}

function M.config()
    G.g.copilot_no_tab_map = true
    G.map({ {'i', '<Right>', 'copilot#Accept("<Right>")', {script = true, silent = true, expr = true}} })
end

function M.setup()
    -- do nothing
end

return M
