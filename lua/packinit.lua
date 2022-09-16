local G = require('G')
local packer_bootstrap = false
local install_path = G.fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if G.fn.empty(G.fn.glob(install_path)) > 0 then
    print('Installing packer.nvim...')
    G.fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    G.cmd [[packadd packer.nvim]]
    packer_bootstrap = true
end

require('packer').startup({function(use)
    use { 'wbthomason/packer.nvim' }
    use { 'yianwillis/vimcdoc' }
    use { 'terryma/vim-expand-region' }
    use { 'lfv89/vim-interestingwords' }
    use { 'mg979/vim-visual-multi' }
    use { 'tpope/vim-dadbod', 'kristijanhusak/vim-dadbod-ui' }
    use { 'neoclide/coc.nvim', branch = 'release' }
    use { 'github/copilot.vim' }
    use { 'voldikss/vim-floaterm' }
    use { 'junegunn/fzf', run = 'cd ~/.fzf && ./install --all', 'junegunn/fzf.vim' }
    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate', 'nvim-treesitter/playground' }
    use { 'iamcco/markdown-preview.nvim', run = 'cd app && yarn install', cmd = 'MarkdownPreview', 'mzlogin/vim-markdown-toc' }
    use { 'kyazdani42/nvim-web-devicons', 'kyazdani42/nvim-tree.lua' }
    use { 'jbyuki/venn.nvim' }
    use { 'yaocccc/nvim-lines.lua', 'yaocccc/nvim-hlchunk', 'yaocccc/vim-comment', 'yaocccc/vim-fcitx2en', 'yaocccc/vim-surround', 'yaocccc/vim-showmarks' }
    if packer_bootstrap then
        require('packer').sync()
    else
        require('pack/vim-expand-region')
        require('pack/vim-interestingwords')
        require('pack/vim-visual-multi')
        require('pack/vim-dadbod')
        require('pack/coc')
        require('pack/copilot')
        require('pack/vim-floaterm')
        require('pack/fzf')
        require('pack/tree-sitter')
        require('pack/markdown')
        require('pack/nvim-tree')
        require('pack/venn')
        require('pack/vim-comment')
        require('pack/nvim-lines')
    end
end, config = {
    git = { clone_timeout = 120 },
    display = {
        working_sym = '[ ]', error_sym = '[✗]', done_sym = '[✓]', removed_sym = ' - ', moved_sym = ' → ', header_sym = '─',
        open_fn = function() return require("packer.util").float({ border = "rounded" }) end
    }
}})
