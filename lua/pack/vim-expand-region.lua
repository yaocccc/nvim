local G = require('G')
local M = {}

function M.config()
    G.map({
        { 'v', 'v', '<Plug>(expand_region_expand)', {silent = true}},
        { 'v', 'V', '<Plug>(expand_region_shrink)', {silent = true}},
    })
end

function M.setup()
    -- do nothing
end

return M
