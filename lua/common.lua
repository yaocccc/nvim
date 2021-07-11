local common = {}

function common.set_maps(maps)
    for _,map in pairs(maps) do
        vim.api.nvim_set_keymap(
            map[1],
            map[2],
            map[3],
            map[4]
        )
    end
end

function common.set_highlights(hls)
    for group,color in pairs(hls) do
        local fg = color.fg and ' ctermfg=' .. color.fg or ' ctermfg=NONE'
        local bg = color.bg and ' ctermbg=' .. color.bg or ' ctermbg=NONE'
        local sp = color.sp and ' cterm=' .. color.sp or ''
        vim.api.nvim_command('highlight ' .. group .. fg .. bg .. sp)
        vim.api.nvim_command('highlight ' .. 'TS' .. group .. fg .. bg .. sp)
    end
end

return common
