local G = require('G')
local M = {}

function M.config()
    G.map({
        { 'v', 'C', ':<c-u>VECHO<cr>', {silent = true, noremap = true}},
    })
end

function M.setup()
    -- do nothing
end

return M
