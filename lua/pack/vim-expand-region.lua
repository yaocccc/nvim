local G = require('G')
local M = {}

function M.config()
    -- do nothing
end

function M.setup()
    G.map({
        { 'v', 'v', '<Plug>(expand_region_expand)', {silent = true}},
        { 'v', 'V', '<Plug>(expand_region_shrink)', {silent = true}},
    })
end

return M
