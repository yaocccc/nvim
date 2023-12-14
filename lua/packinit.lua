local G = require('G')
local packer_bootstrap = false
local install_path = G.fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
local compiled_path = G.fn.stdpath('config')..'/plugin/packer_compiled.lua'
if G.fn.empty(G.fn.glob(install_path)) > 0 then
    print('Installing packer.nvim...')
    G.fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    G.fn.system({'rm', '-rf', compiled_path})
    G.cmd [[packadd packer.nvim]]
    packer_bootstrap = true
end

-- 所有插件配置分 config 和 setup 部分
-- M.config() 发生在插件载入前 一般为 let g:xxx = xxx 或者 hi xxx xxx 或者 map x xxx 之类的 配置
-- M.setup()  发生在插件载入后 一般为 require('xxx').setup() 之类的配置
--
-- packer启动参数说明
-- setup: string or function 发生在packer启动时
-- config: string or function 发生在插件载入后
--
-- 故此处我所有的M.config是直接require的，并不依赖packer是否启动 不依赖插件是否已载入
-- M.setup是在packer启动后才require的，此时插件已经载入，所以可以直接使用插件的setup方法
require('packer').startup({
    function(use)
        -- packer 管理自己的版本
        use { 'wbthomason/packer.nvim' }

        -- 启动时间分析
        use { "dstein64/vim-startuptime", cmd = "StartupTime" }

        -- 中文help doc
        use { 'yianwillis/vimcdoc', event = "CmdLineEnter" }

        -- vv 快速选中内容插件
        require('pack/vim-expand-region').config()
        use { 'terryma/vim-expand-region', config = "require('pack/vim-expand-region').setup()" }

        -- ff 高亮光标下的word
        require('pack/vim-interestingwords').config()
        use { 'lfv89/vim-interestingwords', config = "require('pack/vim-interestingwords').setup()" }

        -- 多光标插件
        require('pack/vim-visual-multi').config()
        use { 'mg979/vim-visual-multi', config = "require('pack/vim-visual-multi').setup()", event = 'CursorHold' }

        -- 数据库可视化UI
        require('pack/vim-dadbod').config()
        use { 'tpope/vim-dadbod', cmd = "DBUI" }
        use { 'kristijanhusak/vim-dadbod-ui', config = "require('pack/vim-dadbod').setup()", after = 'vim-dadbod' }

        -- coc-nvim
        -- 如果想 lazy coc -> {  event = { 'InsertEnter', 'CmdLineEnter', 'CursorHold' }, fn = 'CocAction', keys = '<Plug>(coc-definition)' }
        require('pack/coc').config()
        use { 'neoclide/coc.nvim', config = "require('pack/coc').setup()", branch = 'release' }

        -- wilder 弹出式命令行
        use { 'gelguy/wilder.nvim', event = 'CmdlineEnter', config = 'require("pack/wilder").setup()' }

        -- github copilot
        require('pack/copilot').config()
        use { 'github/copilot.vim', config = "require('pack/copilot').setup()" }

        -- 浮动终端
        require('pack/vim-floaterm').config()
        use { 'voldikss/vim-floaterm', config = "require('pack/vim-floaterm').setup()" }

        -- fzf
        require('pack/fzf').config()
        use { 'junegunn/fzf', event = "CmdLineEnter" }
        use { 'junegunn/fzf.vim', config = "require('pack/fzf').setup()", run = 'cd ~/.fzf && ./install --all', after = "fzf" }

        -- tree-sitter
        require('pack/tree-sitter').config()
        use { 'nvim-treesitter/nvim-treesitter', config = "require('pack/tree-sitter').setup()", run = ':TSUpdate', event = 'BufRead' }
        use { 'nvim-treesitter/playground', after = 'nvim-treesitter' }

        -- markdown预览插件 导航生成插件
        require('pack/markdown').config()
        use { 'mzlogin/vim-markdown-toc', ft = 'markdown' }
        use { 'iamcco/markdown-preview.nvim', config = "require('pack/markdown').setup()", run = 'cd app && yarn install', cmd = 'MarkdownPreview', ft = 'markdown' }

        -- 文件管理器
        require('pack/nvim-tree').config()
        use { 'kyazdani42/nvim-web-devicons' }
        use { 'kyazdani42/nvim-tree.lua', config = "require('pack/nvim-tree').setup()", cmd = { 'NvimTreeToggle', 'NvimTreeFindFileToggle' } }

        -- 状态栏 & 标题栏
        require('pack/nvim-lines').config()
        use { 'yaocccc/nvim-lines.lua', config = "require('pack/nvim-lines').setup()" }

        require('pack/venn').config()
        use { 'jbyuki/venn.nvim', cmd = 'VBox' }

        -- 部分个人自写插件
        require('pack/yaocccc').config()                                               -- yaocccc/* 共用一个config
        use { 'yaocccc/vim-comment', cmd = '*ToggleComment' }                          -- 注释插件
        use { 'yaocccc/vim-echo', cmd = "VECHO" }                                      -- 快速echo、print
        use { 'yaocccc/vim-fcitx2en', event = 'InsertLeavePre' }                       -- 退出输入模式时自动切换到英文
        use { 'yaocccc/nvim-hlchunk', event = { 'CursorMoved', 'CursorMovedI' } }      -- 高亮{}范围
        use { 'yaocccc/vim-surround', event = 'ModeChanged' }                          -- 操作成对的 ""  {}  [] 等的插件
        use { 'yaocccc/nvim-foldsign', event = 'CursorHold', config = 'require("nvim-foldsign").setup()' } -- signcolumn显示折叠信息
        use { 'yaocccc/nvim-hl-mdcodeblock.lua', after = 'nvim-treesitter', config = "require('pack/markdown').setup_hlcodeblock()" }
    end,
    config = {
        git = { clone_timeout = 120, depth = 1 },
        display = {
            working_sym = '[ ]', error_sym = '[✗]', done_sym = '[✓]', removed_sym = ' - ', moved_sym = ' → ', header_sym = '─',
            open_fn = function() return require("packer.util").float({ border = "rounded" }) end
        }
    }
})

if packer_bootstrap then
    require('packer').sync()
end

