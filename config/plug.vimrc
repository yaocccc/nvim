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
        " 快速对齐
            Plug 'junegunn/vim-easy-align'
        " coc
            Plug 'neoclide/coc.nvim', {'branch': 'release'}
        " 括号高亮
            Plug 'luochen1990/rainbow'
        " markdown
            Plug 'iamcco/mathjax-support-for-mkdp'
            Plug 'iamcco/markdown-preview.vim'
        " fzf
        " brew install the_silver_searcher
        " brew install fd
        " brew install fzf
            Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
            Plug 'junegunn/fzf.vim'
        " 显示缩进
            Plug 'Yggdroot/indentLine'
        " 多游标
            Plug 'mg979/vim-visual-multi', {'branch': 'master'}
        " golang
            Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
        " javascript
            Plug 'pangloss/vim-javascript'
    call plug#end()

" Plug Setting
    " vim-expand-region 快速选择
        " v扩大选择 V缩小选择
            xmap v <Plug>(expand_region_expand)
            xmap V <Plug>(expand_region_shrink)

    " coc-vim
        " 全局插件
            let g:coc_global_extensions=['coc-css', 'coc-html', 'coc-tsserver', 'coc-vetur', 'coc-word', 'coc-python', 'coc-explorer', 'coc-markdownlint', 'coc-pairs', 'coc-snippets', 'coc-tabnine', 'coc-translator', 'coc-json', 'coc-go']
        " com-rename
            nmap <F2> <Plug>(coc-rename)
        " coc-snippets便携自定义补全文件
            " F9 :CocCommand snippets.editSnippets 编写自定义的代码片段
            nnoremap <F9> :CocCommand snippets.editSnippets<CR>
        " 使用tab补全
            inoremap <expr> <TAB>     pumvisible() ? "\<C-n>" : <SID>check_back_space() ? "\<TAB>" : coc#refresh()
            inoremap <expr> <S-TAB>   pumvisible() ? "\<C-p>" : "\<C-h>"
            inoremap <expr> <c-space> coc#refresh()
            inoremap <expr> <CR>      pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
        " 退格时也检查补全
            function! s:check_back_space() abort
                let col = col('.') - 1
                return !col || getline('.')[col - 1] =~# '\s'
            endfunction
        " Use `[g` and `]g` to navigate diagnostics
            nmap [g <Plug>(coc-diagnostic-prev)
            nmap ]g <Plug>(coc-diagnostic-next)
        " gd gy 跳转到定义
            nmap gd <Plug>(coc-definition)
            nmap gy <Plug>(coc-type-definition)
        " K 显示文档
            nnoremap K :call <SID>show_documentation()<CR>
            function! s:show_documentation()
                if (index(['vim','help'], &filetype) >= 0)
                    execute 'h '.expand('<cword>')
                else
                    call CocAction('doHover')
                endif
            endfunction
        " coc-translator 显示翻译
            nmap <Leader>m <Plug>(coc-translator-p)
            xmap <Leader>m <Plug>(coc-translator-pv)
            smap <Leader>m <c-g><Plug>(coc-translator-pv)
        " coc-explorer
            nmap <silent>tt :CocCommand explorer --preset floating<CR>

    " git vim-fugitive
        " gl 打开 git status列表
            nnoremap gl :Gstatus<CR>

    " git gitgutter
        " leader + g 切换git修改高亮
            nmap <c-g> :GitGutterLineHighlightsToggle<CR>

    " js-beautify  npm i js-beautify -g
            snoremap =  <c-g>:!js-beautify<CR>
            xnoremap =  :!js-beautify<CR>
            nnoremap == :.!js-beautify<CR>

    " js highlight
            let g:javascript_plugin_jsdoc = 1

    " rainbow
            let g:rainbow_active = 1

    " 快速跳转 vim-interestingwords
        " 设置不同匹配词颜色不同
            let g:interestingWordsRandomiseColors = 1
        " ff 匹配/取消 当前词  FF取消匹配所有
            nnoremap ff :call InterestingWords('n')<CR>
            nnoremap FF :call UncolorAllWords()<CR>
        " n跳转到下个 N跳转到上个
            nnoremap n  :call WordNavigation('forward')<CR>
            nnoremap N  :call WordNavigation('backward')<CR>

    " markdown
        " F7开始浏览器预览 F8关闭
            nmap <F7> <Plug>MarkdownPreview
            imap <F7> <Plug>MarkdownPreview
            nmap <F8> <Plug>StopMarkdownPreview
            imap <F8> <Plug>StopMarkdownPreview

    " fzf
        " maps
            command! -bang -nargs=* Ag call fzf#vim#ag(<q-args>, <bang>0 ? fzf#vim#with_preview('right:50%') : fzf#vim#with_preview('right:50%'), <bang>0)
            nnoremap <c-a> :Ag<CR>
            nnoremap <c-t> :Files<CR>
            nnoremap <c-h> :History<CR>
            nnoremap <c-l> :Lines<CR>

    " 显示缩进线
            let g:indentLine_char_list = ['|', '¦', '┆', '┊']

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
            let g:VM_maps['Skip Region']        = '≈'
            let g:VM_maps['Increase']           = '+'
            let g:VM_maps['Decrease']           = '-'

    " vim-easy-align
            xmap ga <Plug>(EasyAlign)
            nmap ga <Plug>(EasyAlign)
