" Plug
    call plug#begin('~/.config/nvim/plugged')
        " 中文文档
            Plug 'yianwillis/vimcdoc'
        " git
            Plug 'tpope/vim-fugitive'
            Plug 'airblade/vim-gitgutter'
        " marks
            Plug 'kshenoy/vim-signature'
        " 快速选择
            Plug 'terryma/vim-expand-region'
        " 快速跳转
            Plug 'lfv89/vim-interestingwords'
        " coc
            Plug 'neoclide/coc.nvim', {'branch': 'release'}
        " 括号高亮
            Plug 'luochen1990/rainbow'
        " markdown
            Plug 'iamcco/markdown-preview.vim'
        " fzf
        " brew install the_silver_searcher
        " brew install fd
        " brew install bat
        " brew install fzf
            Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
            Plug 'junegunn/fzf.vim'
        " 显示缩进
            Plug 'Yggdroot/indentLine'
        " 多光标
            Plug 'mg979/vim-visual-multi', {'branch': 'master'}
        " lsp + hl
        " npm i js-beautify -g
            Plug 'pangloss/vim-javascript'
    call plug#end()

" Plug Setting
    " vim-expand-region 快速选择
        " v扩大选择 V缩小选择
            xmap <silent> v <Plug>(expand_region_expand)
            xmap <silent> V <Plug>(expand_region_shrink)
            smap <silent> v <c-g><Plug>(expand_region_expand)
            smap <silent> V <c-g><Plug>(expand_region_shrink)

    " coc-vim
        " CocToggle
            nnoremap <F4> :call Coc_toggle()<cr>
            func! Coc_toggle()
                if g:coc_enabled == 1
                    :CocDisable
                else
                    :CocEnable
                endif
            endf
        " 全局插件
            let g:coc_global_extensions=['coc-css', 'coc-html', 'coc-tsserver', 'coc-vetur', 'coc-word', 'coc-python', 'coc-explorer', 'coc-markdownlint', 'coc-pairs', 'coc-snippets', 'coc-tabnine', 'coc-translator', 'coc-json', 'coc-go']
        " com-rename
            nmap <silent> <F2> <Plug>(coc-rename)
        " coc-snippets便携自定义补全文件
            " F9 :CocCommand snippets.editSnippets 编写自定义的代码片段
            nnoremap <silent> <F9> :CocCommand snippets.editSnippets<CR>
        " 使用tab补全
            inoremap <expr> <TAB>     pumvisible() ? "\<C-n>" : <SID>check_back_space() ? "\<TAB>" : coc#refresh()
            inoremap <expr> <S-TAB>   pumvisible() ? "\<C-p>" : "\<C-h>"
            inoremap <expr> <c-space> coc#refresh()
            inoremap <expr> <CR>      pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
        " 退格时也检查补全
            func! s:check_back_space() abort
                let col = col('.') - 1
                return !col || getline('.')[col - 1] =~# '\s'
            endf
        " Use `[g` and `]g` to navigate diagnostics
            nmap <silent> [g <Plug>(coc-diagnostic-prev)
            nmap <silent> ]g <Plug>(coc-diagnostic-next)
        " gd gy 跳转到定义
            nmap <silent> gd <Plug>(coc-definition)
            nmap <silent> gy <Plug>(coc-type-definition)
        " K 显示文档
            nnoremap <silent> K :call <SID>show_documentation()<CR>
            func! s:show_documentation()
                if (index(['vim','help'], &filetype) >= 0)
                    execute 'h '.expand('<cword>')
                else
                    call CocAction('doHover')
                endif
            endf
        " coc-translator 显示翻译
            nmap <silent> <Leader>m <Plug>(coc-translator-p)
            xmap <silent> <Leader>m <Plug>(coc-translator-pv)
            smap <silent> <Leader>m <c-g><Plug>(coc-translator-pv)
        " coc-explorer
            nmap <silent>tt :CocCommand explorer --preset floating<CR>
            au User CocExplorerOpenPre  hi Pmenu ctermbg=NONE
            au User CocExplorerQuitPost hi Pmenu ctermbg=238

    " git vim-fugitive
        " gl 打开 git status列表
            nnoremap <silent> gl :Gstatus<CR>

    " git gitgutter
        " leader + g 切换git修改高亮 && 开启gitlens
            nmap <silent> <c-g> :GitGutterLineHighlightsToggle<CR>:GitlineToggle<CR>

    " js-beautify  npm i js-beautify -g
            let g:javascript_plugin_jsdoc = 1
            snoremap <silent> =  <c-g>:!js-beautify<CR>
            xnoremap <silent> =  :!js-beautify<CR>
            nnoremap <silent> == :.!js-beautify<CR>

    " rainbow
            let g:rainbow_active = 1

    " 快速跳转 vim-interestingwords
        " 设置不同匹配词颜色不同
            let g:interestingWordsRandomiseColors = 1
        " ff 匹配/取消 当前词  FF取消匹配所有
            nnoremap <silent> ff :call InterestingWords('n')<CR>
            nnoremap <silent> FF :call UncolorAllWords()<CR>
        " n跳转到下个 N跳转到上个
            nnoremap <silent> n  :call WordNavigation('forward')<CR>
            nnoremap <silent> N  :call WordNavigation('backward')<CR>

    " markdown
        " F7开始浏览器预览 F8关闭 c-p 导出为pdf
            nmap <silent> <F7> <Plug>MarkdownPreview
            imap <silent> <F7> <Plug>MarkdownPreview
            nmap <silent> <F8> <Plug>StopMarkdownPreview
            imap <silent> <F8> <Plug>StopMarkdownPreview

    " fzf
        " maps
            command! -bang -nargs=* Ag call fzf#vim#ag(<q-args>, <bang>0 ? fzf#vim#with_preview('right:50%') : fzf#vim#with_preview('right:50%'), <bang>0)
            nnoremap <silent> <c-a> :Ag<CR>
            nnoremap <silent> <c-t> :Files<CR>
            nnoremap <silent> <c-h> :History<CR>
            nnoremap <silent> <c-l> :Lines<CR>

    " 显示缩进线
            let g:indentLine_char_list = ['|', '¦']

    " 多游标
            let g:VM_theme                      = 'iceblue'
            let g:VM_highlight_matches          = 'underline'
            let g:VM_maps                       = {}
            let g:VM_maps['Find Under']         = '<C-n>'
            let g:VM_maps['Find Subword Under'] = '<C-n>'
            let g:VM_maps['Select All']         = '<c-d>'
            let g:VM_maps['Visual All']         = '<c-d>'
            let g:VM_maps["Select Cursor Down"] = '<M-Down>'
            let g:VM_maps["Select Cursor Up"]   = '<M-Up>'
            let g:VM_maps["Select l"]           = '<M-Right>'
            let g:VM_maps["Select h"]           = '<M-Left>'
            let g:VM_maps['Remove Region']      = 'q'
            let g:VM_maps['Increase']           = '+'
            let g:VM_maps['Decrease']           = '-'
