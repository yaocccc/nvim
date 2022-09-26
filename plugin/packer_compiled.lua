-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

_G._packer = _G._packer or {}
_G._packer.inside_compile = true

local time
local profile_info
local should_profile = false
if should_profile then
  local hrtime = vim.loop.hrtime
  profile_info = {}
  time = function(chunk, start)
    if start then
      profile_info[chunk] = hrtime()
    else
      profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
    end
  end
else
  time = function(chunk, start) end
end

local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end
  if threshold then
    table.insert(results, '(Only showing plugins that took longer than ' .. threshold .. ' ms ' .. 'to load)')
  end

  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/home/chenyc/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/home/chenyc/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/home/chenyc/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/home/chenyc/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/chenyc/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["coc.nvim"] = {
    config = { "require('pack/coc').setup()" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/chenyc/.local/share/nvim/site/pack/packer/opt/coc.nvim",
    url = "https://github.com/neoclide/coc.nvim"
  },
  ["copilot.vim"] = {
    config = { "require('pack/copilot').setup()" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/chenyc/.local/share/nvim/site/pack/packer/opt/copilot.vim",
    url = "https://github.com/github/copilot.vim"
  },
  fzf = {
    loaded = true,
    path = "/home/chenyc/.local/share/nvim/site/pack/packer/start/fzf",
    url = "https://github.com/junegunn/fzf"
  },
  ["fzf.vim"] = {
    config = { "require('pack/fzf').setup()" },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/home/chenyc/.local/share/nvim/site/pack/packer/opt/fzf.vim",
    url = "https://github.com/junegunn/fzf.vim"
  },
  ["markdown-preview.nvim"] = {
    commands = { "MarkdownPreview" },
    config = { "require('pack/markdown').setup()" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/chenyc/.local/share/nvim/site/pack/packer/opt/markdown-preview.nvim",
    url = "https://github.com/iamcco/markdown-preview.nvim"
  },
  ["nvim-hlchunk"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/chenyc/.local/share/nvim/site/pack/packer/opt/nvim-hlchunk",
    url = "https://github.com/yaocccc/nvim-hlchunk"
  },
  ["nvim-lines.lua"] = {
    config = { "require('pack/nvim-lines').setup()" },
    loaded = true,
    path = "/home/chenyc/.local/share/nvim/site/pack/packer/start/nvim-lines.lua",
    url = "https://github.com/yaocccc/nvim-lines.lua"
  },
  ["nvim-tree.lua"] = {
    commands = { "NvimTreeToggle", "NvimTreeFindFileToggle" },
    config = { "require('pack/nvim-tree').setup()" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/chenyc/.local/share/nvim/site/pack/packer/opt/nvim-tree.lua",
    url = "https://github.com/kyazdani42/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    after = { "playground" },
    config = { "require('pack/tree-sitter').setup()" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/chenyc/.local/share/nvim/site/pack/packer/opt/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/home/chenyc/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  playground = {
    load_after = {
      ["nvim-treesitter"] = true
    },
    loaded = false,
    needs_bufread = true,
    path = "/home/chenyc/.local/share/nvim/site/pack/packer/opt/playground",
    url = "https://github.com/nvim-treesitter/playground"
  },
  ["vim-comment"] = {
    config = { "require('pack/vim-comment').setup()" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/chenyc/.local/share/nvim/site/pack/packer/opt/vim-comment",
    url = "https://github.com/yaocccc/vim-comment"
  },
  ["vim-dadbod"] = {
    loaded = true,
    path = "/home/chenyc/.local/share/nvim/site/pack/packer/start/vim-dadbod",
    url = "https://github.com/tpope/vim-dadbod"
  },
  ["vim-dadbod-ui"] = {
    config = { "require('pack/vim-dadbod').setup()" },
    load_after = {},
    loaded = true,
    needs_bufread = true,
    path = "/home/chenyc/.local/share/nvim/site/pack/packer/opt/vim-dadbod-ui",
    url = "https://github.com/kristijanhusak/vim-dadbod-ui"
  },
  ["vim-expand-region"] = {
    config = { "require('pack/vim-expand-region').setup()" },
    loaded = true,
    path = "/home/chenyc/.local/share/nvim/site/pack/packer/start/vim-expand-region",
    url = "https://github.com/terryma/vim-expand-region"
  },
  ["vim-fcitx2en"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/chenyc/.local/share/nvim/site/pack/packer/opt/vim-fcitx2en",
    url = "https://github.com/yaocccc/vim-fcitx2en"
  },
  ["vim-floaterm"] = {
    config = { "require('pack/vim-floaterm').setup()" },
    loaded = true,
    path = "/home/chenyc/.local/share/nvim/site/pack/packer/start/vim-floaterm",
    url = "https://github.com/voldikss/vim-floaterm"
  },
  ["vim-interestingwords"] = {
    config = { "require('pack/vim-interestingwords').setup()" },
    loaded = true,
    path = "/home/chenyc/.local/share/nvim/site/pack/packer/start/vim-interestingwords",
    url = "https://github.com/lfv89/vim-interestingwords"
  },
  ["vim-markdown-toc"] = {
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/home/chenyc/.local/share/nvim/site/pack/packer/opt/vim-markdown-toc",
    url = "https://github.com/mzlogin/vim-markdown-toc"
  },
  ["vim-showmarks"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/chenyc/.local/share/nvim/site/pack/packer/opt/vim-showmarks",
    url = "https://github.com/yaocccc/vim-showmarks"
  },
  ["vim-surround"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/chenyc/.local/share/nvim/site/pack/packer/opt/vim-surround",
    url = "https://github.com/yaocccc/vim-surround"
  },
  ["vim-visual-multi"] = {
    config = { "require('pack/vim-visual-multi').setup()" },
    loaded = true,
    path = "/home/chenyc/.local/share/nvim/site/pack/packer/start/vim-visual-multi",
    url = "https://github.com/mg979/vim-visual-multi"
  },
  vimcdoc = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/chenyc/.local/share/nvim/site/pack/packer/opt/vimcdoc",
    url = "https://github.com/yianwillis/vimcdoc"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: vim-interestingwords
time([[Config for vim-interestingwords]], true)
require('pack/vim-interestingwords').setup()
time([[Config for vim-interestingwords]], false)
-- Config for: vim-visual-multi
time([[Config for vim-visual-multi]], true)
require('pack/vim-visual-multi').setup()
time([[Config for vim-visual-multi]], false)
-- Config for: vim-floaterm
time([[Config for vim-floaterm]], true)
require('pack/vim-floaterm').setup()
time([[Config for vim-floaterm]], false)
-- Config for: nvim-lines.lua
time([[Config for nvim-lines.lua]], true)
require('pack/nvim-lines').setup()
time([[Config for nvim-lines.lua]], false)
-- Config for: vim-expand-region
time([[Config for vim-expand-region]], true)
require('pack/vim-expand-region').setup()
time([[Config for vim-expand-region]], false)
-- Load plugins in order defined by `after`
time([[Sequenced loading]], true)
vim.cmd [[ packadd fzf ]]
vim.cmd [[ packadd fzf.vim ]]

-- Config for: fzf.vim
require('pack/fzf').setup()

vim.cmd [[ packadd vim-dadbod ]]
vim.cmd [[ packadd vim-dadbod-ui ]]

-- Config for: vim-dadbod-ui
require('pack/vim-dadbod').setup()

time([[Sequenced loading]], false)

-- Command lazy-loads
time([[Defining lazy-load commands]], true)
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file NvimTreeToggle lua require("packer.load")({'nvim-tree.lua'}, { cmd = "NvimTreeToggle", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file MarkdownPreview lua require("packer.load")({'markdown-preview.nvim'}, { cmd = "MarkdownPreview", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file NvimTreeFindFileToggle lua require("packer.load")({'nvim-tree.lua'}, { cmd = "NvimTreeFindFileToggle", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
time([[Defining lazy-load commands]], false)

vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Filetype lazy-loads
time([[Defining lazy-load filetype autocommands]], true)
vim.cmd [[au FileType markdown ++once lua require("packer.load")({'markdown-preview.nvim', 'vim-markdown-toc'}, { ft = "markdown" }, _G.packer_plugins)]]
time([[Defining lazy-load filetype autocommands]], false)
  -- Event lazy-loads
time([[Defining lazy-load event autocommands]], true)
vim.cmd [[au VimEnter * ++once lua require("packer.load")({'vim-comment', 'coc.nvim', 'nvim-hlchunk', 'vim-showmarks', 'vim-surround', 'vimcdoc'}, { event = "VimEnter *" }, _G.packer_plugins)]]
vim.cmd [[au BufRead * ++once lua require("packer.load")({'nvim-treesitter'}, { event = "BufRead *" }, _G.packer_plugins)]]
vim.cmd [[au InsertEnter * ++once lua require("packer.load")({'copilot.vim'}, { event = "InsertEnter *" }, _G.packer_plugins)]]
vim.cmd [[au InsertLeavePre * ++once lua require("packer.load")({'vim-fcitx2en'}, { event = "InsertLeavePre *" }, _G.packer_plugins)]]
time([[Defining lazy-load event autocommands]], false)
vim.cmd("augroup END")
vim.cmd [[augroup filetypedetect]]
time([[Sourcing ftdetect script at: /home/chenyc/.local/share/nvim/site/pack/packer/opt/vim-markdown-toc/ftdetect/markdown.vim]], true)
vim.cmd [[source /home/chenyc/.local/share/nvim/site/pack/packer/opt/vim-markdown-toc/ftdetect/markdown.vim]]
time([[Sourcing ftdetect script at: /home/chenyc/.local/share/nvim/site/pack/packer/opt/vim-markdown-toc/ftdetect/markdown.vim]], false)
vim.cmd("augroup END")

_G._packer.inside_compile = false
if _G._packer.needs_bufread == true then
  vim.cmd("doautocmd BufRead")
end
_G._packer.needs_bufread = false

if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
