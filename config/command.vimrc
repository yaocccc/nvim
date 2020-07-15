" 一键运行文件
    command! Run call <SID>runFile()
    noremap <F5> :Run<CR>
    inoremap <F5> <ESC>:Run<CR>

    func! s:runFile()
        exec "w"
        if &filetype == 'javascript'
            exec 'w !node %'
        elseif &filetype == 'typescript'
            exec 'w !ts-node %'
        elseif &filetype == 'python'
            exec 'w !python %'
        elseif &filetype == 'go'
            exec 'w !go run %'
        endif
    endf


" 重设tab长度
    command! -nargs=* SetTab call <SID>switchTab(<q-args>)
    func! s:switchTab(tab_len)
        if !empty(a:tab_len)
            let &shiftwidth = a:tab_len
            let &softtabstop= a:tab_len
            let &tabstop = a:tab_len
        else
            let tab_len = input('input shiftwidth: ')
            if empty(tab_len)
                redraw!
                return
            endif
            let &shiftwidth = tab_len
            let &softtabstop= tab_len
            let &tabstop = tab_len
            redraw!
        endif
        echo printf('shiftwidth: %d', &shiftwidth)
    endf


" 快速注释
    nnoremap <silent> // :<c-u>call <SID>COM(line("."), line("."))<CR>
    xnoremap <silent> /  :<c-u>call <SID>COM(line("'<"), line("'>"))<CR>
    snoremap <silent> /  <c-g>:<c-u>call <SID>COM(line("'<"), line("'>"))<CR>

    func! s:COM(num1, num2)
        let com = s:getCom()
        let firstC = getline(a:num1)[0]
        for num in range(a:num1, a:num2)
            let line = com[0] == firstC ? substitute(getline(num), '^'.com, '', 'g') : substitute(getline(num), '^', com, 'g')
            call setline(num, line)
        endfor
    endf

    func! s:getCom()
        if expand('%:e') == 'vim' || expand('%:e') == 'vimrc'
            return '"'
        elseif expand('%:e') == 'zsh' || expand('%:e') == 'zshrc'
            return '#'
        endif
        return '//'
    endf


" ds删除符号 cs修改符号
    nmap ds  <Plug>Dsurround
    nmap cs  <Plug>Csurround
    nnoremap <silent> <Plug>Dsurround  :<C-U>call <SID>dosurround(<SID>inputtarget())<CR>
    nnoremap <silent> <Plug>Csurround  :<C-U>call <SID>changesurround()<CR>

    func! s:getchar()
        let c = getchar()
        if c =~ '^\d\+$'
            let c = nr2char(c)
        endif
        return c
    endf

    func! s:inputtarget()
        let c = s:getchar()
        while c =~ '^\d\+$'
            let c .= s:getchar()
        endwhile
        if c == " "
            let c .= s:getchar()
        endif
        if c =~ "\<Esc>\|\<C-C>\|\0"
            return ""
        else
            return c
        endif
    endf

    func! s:inputreplacement()
        let c = s:getchar()
        if c == " "
            let c .= s:getchar()
        endif
        if c =~ "\<Esc>" || c =~ "\<C-C>"
            return ""
        else
            return c
        endif
    endf

    func! s:beep()
        exe "norm! \<Esc>"
        return ""
    endf

    func! s:reindent()
        if exists("b:surround_indent") ? b:surround_indent : (!exists("g:surround_indent") || g:surround_indent)
            silent norm! '[=']
        endif
    endf

    func! s:wrapreg(reg,char,removed,special)
        let orig = getreg(a:reg)
        let type = substitute(getregtype(a:reg),'\d\+$','','')
        let new = s:wrap(orig,a:char,type,a:removed,a:special)
        call setreg(a:reg,new,type)
    endf

    func! s:wrap(string,char,type,removed,special)
        let keeper = a:string
        let newchar = a:char
        let s:input = ""
        let type = a:type
        let linemode = type ==# 'V' ? 1 : 0
        let before = ""
        let after  = ""
        if type ==# "V"
            let initspaces = matchstr(keeper,'\%^\s*')
        else
            let initspaces = matchstr(getline('.'),'\%^\s*')
        endif
        let pairs = "b()B{}r[]a<>"
        let extraspace = ""
        if newchar =~ '^ '
            let newchar = strpart(newchar,1)
            let extraspace = ' '
        endif
        let idx = stridx(pairs,newchar)
        if newchar == ' '
            let before = ''
            let after  = ''
        elseif exists("b:surround_".char2nr(newchar))
            let all    = s:process(b:surround_{char2nr(newchar)})
            let before = s:extractbefore(all)
            let after  =  s:extractafter(all)
        elseif exists("g:surround_".char2nr(newchar))
            let all    = s:process(g:surround_{char2nr(newchar)})
            let before = s:extractbefore(all)
            let after  =  s:extractafter(all)
        elseif newchar ==# "p"
            let before = "\n"
            let after  = "\n\n"
        elseif newchar ==# 's'
            let before = ' '
            let after  = ''
        elseif newchar ==# ':'
            let before = ':'
            let after = ''
        elseif newchar =~# "[tT\<C-T><]"
            let dounmapp = 0
            let dounmapb = 0
            if !maparg(">","c")
                let dounmapb = 1
                exe "cn"."oremap > ><CR>"
            endif
            let default = ""
            if newchar ==# "T"
                if !exists("s:lastdel")
                    let s:lastdel = ""
                endif
                let default = matchstr(s:lastdel,'<\zs.\{-\}\ze>')
            endif
            let tag = input("<",default)
            if dounmapb
                silent! cunmap >
            endif
            let s:input = tag
            if tag != ""
                let keepAttributes = ( match(tag, ">$") == -1 )
                let tag = substitute(tag,'>*$','','')
                let attributes = ""
                if keepAttributes
                    let attributes = matchstr(a:removed, '<[^ \t\n]\+\zs\_.\{-\}\ze>')
                endif
                let s:input = tag . '>'
                if tag =~ '/$'
                    let tag = substitute(tag, '/$', '', '')
                    let before = '<'.tag.attributes.' />'
                    let after = ''
                else
                    let before = '<'.tag.attributes.'>'
                    let after  = '</'.substitute(tag,' .*','','').'>'
                endif
                if newchar == "\<C-T>"
                    if type ==# "v" || type ==# "V"
                        let before .= "\n\t"
                    endif
                    if type ==# "v"
                        let after  = "\n". after
                    endif
                endif
            endif
        elseif newchar ==# 'l' || newchar == '\'
            let env = input('\begin{')
            if env != ""
                let s:input = env."\<CR>"
                let env = '{' . env
                let env .= s:closematch(env)
                echo '\begin'.env
                let before = '\begin'.env
                let after  = '\end'.matchstr(env,'[^}]*').'}'
            endif
        elseif newchar ==# 'f' || newchar ==# 'F'
            let fnc = input('function: ')
            if fnc != ""
                let s:input = fnc."\<CR>"
                let before = substitute(fnc,'($','','').'('
                let after  = ')'
                if newchar ==# 'F'
                    let before .= ' '
                    let after = ' ' . after
                endif
            endif
        elseif newchar ==# "\<C-F>"
            let fnc = input('function: ')
            let s:input = fnc."\<CR>"
            let before = '('.fnc.' '
            let after = ')'
        elseif idx >= 0
            let spc = (idx % 3) == 1 ? " " : ""
            let idx = idx / 3 * 3
            let before = strpart(pairs,idx+1,1) . spc
            let after  = spc . strpart(pairs,idx+2,1)
        elseif newchar == "\<C-[>" || newchar == "\<C-]>"
            let before = "{\n\t"
            let after  = "\n}"
        elseif newchar !~ '\a'
            let before = newchar
            let after  = newchar
        else
            let before = ''
            let after  = ''
        endif
        let after  = substitute(after ,'\n','\n'.initspaces,'g')
        if type ==# 'V' || (a:special && type ==# "v")
            let before = substitute(before,' \+$','','')
            let after  = substitute(after ,'^ \+','','')
            if after !~ '^\n'
                let after  = initspaces.after
            endif
            if keeper !~ '\n$' && after !~ '^\n'
                let keeper .= "\n"
            elseif keeper =~ '\n$' && after =~ '^\n'
                let after = strpart(after,1)
            endif
            if keeper !~ '^\n' && before !~ '\n\s*$'
                let before .= "\n"
                if a:special
                    let before .= "\t"
                endif
            elseif keeper =~ '^\n' && before =~ '\n\s*$'
                let keeper = strcharpart(keeper,1)
            endif
            if type ==# 'V' && keeper =~ '\n\s*\n$'
                let keeper = strcharpart(keeper,0,strchars(keeper) - 1)
            endif
        endif
        if type ==# 'V'
            let before = initspaces.before
        endif
        if before =~ '\n\s*\%$'
            if type ==# 'v'
                let keeper = initspaces.keeper
            endif
            let padding = matchstr(before,'\n\zs\s\+\%$')
            let before  = substitute(before,'\n\s\+\%$','\n','')
            let keeper = s:fixindent(keeper,padding)
        endif
        if type ==# 'V'
            let keeper = before.keeper.after
        elseif type =~ "^\<C-V>"
            let repl = substitute(before,'[\\~]','\\&','g').'\1'.substitute(after,'[\\~]','\\&','g')
            let repl = substitute(repl,'\n',' ','g')
            let keeper = substitute(keeper."\n",'\(.\{-\}\)\(\n\)',repl.'\n','g')
            let keeper = substitute(keeper,'\n\%$','','')
        else
            let keeper = before.extraspace.keeper.extraspace.after
        endif
        return keeper
    endf

    func! s:dosurround(...)
        let scount = v:count1
        let char = (a:0 ? a:1 : s:inputtarget())
        let spc = ""
        if char =~ '^\d\+'
            let scount = scount * matchstr(char,'^\d\+')
            let char = substitute(char,'^\d\+','','')
        endif
        if char =~ '^ '
            let char = strpart(char,1)
            let spc = 1
        endif
        if char == 'a'
            let char = '>'
        endif
        if char == 'r'
            let char = ']'
        endif
        let newchar = ""
        if a:0 > 1
            let newchar = a:2
            if newchar == "\<Esc>" || newchar == "\<C-C>" || newchar == ""
                return s:beep()
            endif
        endif
        let append = ""
        let original = getreg('"')
        let otype = getregtype('"')
        call setreg('"',"")
        let strcount = (scount == 1 ? "" : scount)
        if char == '/'
            exe 'norm! '.strcount.'[/d'.strcount.']/'
        elseif char =~# '[[:punct:][:space:]]' && char !~# '[][(){}<>"''`]'
            exe 'norm! T'.char
            if getline('.')[col('.')-1] == char
                exe 'norm! l'
            endif
            exe 'norm! dt'.char
        else
            exe 'norm! d'.strcount.'i'.char
        endif
        let keeper = getreg('"')
        let okeeper = keeper
        if keeper == ""
            return ""
        endif
        let oldline = getline('.')
        let oldlnum = line('.')
        if char ==# "p"
            call setreg('"','','V')
        elseif char ==# "s" || char ==# "w" || char ==# "W"
            call setreg('"','')
        elseif char =~ "[\"'`]"
            exe "norm! i \<Esc>d2i".char
            call setreg('"',substitute(getreg('"'),' ','',''))
        elseif char == '/'
            norm! "_x
            call setreg('"','/**/',"c")
            let keeper = substitute(substitute(keeper,'^/\*\s\=','',''),'\s\=\*$','','')
        elseif char =~# '[[:punct:][:space:]]' && char !~# '[][(){}<>]'
            exe 'norm! F'.char
            exe 'norm! df'.char
        else
            call search('\m.', 'bW')
            exe "norm! da".char
        endif
        let removed = getreg('"')
        let rem2 = substitute(removed,'\n.*','','')
        let oldhead = strpart(oldline,0,strlen(oldline)-strlen(rem2))
        let oldtail = strpart(oldline,  strlen(oldline)-strlen(rem2))
        let regtype = getregtype('"')
        if char =~# '[\[({<T]' || spc
            let keeper = substitute(keeper,'^\s\+','','')
            let keeper = substitute(keeper,'\s\+$','','')
        endif
        if col("']") == col("$") && virtcol('.') + 1 == virtcol('$')
            if oldhead =~# '^\s*$' && a:0 < 2
                let keeper = substitute(keeper,'\%^\n'.oldhead.'\(\s*.\{-\}\)\n\s*\%$','\1','')
            endif
            let pcmd = "p"
        else
            let pcmd = "P"
        endif
        if line('.') + 1 < oldlnum && regtype ==# "V"
            let pcmd = "p"
        endif
        call setreg('"',keeper,regtype)
        if newchar != ""
            let special = a:0 > 2 ? a:3 : 0
            call s:wrapreg('"',newchar,removed,special)
        endif
        silent exe 'norm! ""'.pcmd.'`['
        if removed =~ '\n' || okeeper =~ '\n' || getreg('"') =~ '\n'
            call s:reindent()
        endif
        if getline('.') =~ '^\s\+$' && keeper =~ '^\s*\n'
            silent norm! cc
        endif
    endf

    func! s:changesurround(...)
        let a = s:inputtarget()
        if a == ""
            return s:beep()
        endif
        let b = s:inputreplacement()
        if b == ""
            return s:beep()
        endif
        call s:dosurround(a,b,a:0 && a:1)
    endf

" GitLens
    command! GitLensEnable  call GitLensEnable()
    command! GitLensDisable call GitLensDisable()
    command! GitLensToggle call GitLensToggle()
    hi GitBlame ctermfg=8
    let s:gitlineTimer   = -1
    let g:gitlineEnabled = 0

    func! GitLensToggle() abort
        if g:gitlineEnabled == 0
            call GitLensEnable()
        else
            call GitLensDisable()
        endif
    endf

    func! GitLensEnable() abort
        if g:gitlineEnabled == 1 || &filetype is# '' || index(['help', 'nerdtree', 'quickfix', 'tags'], &filetype) is# '-1' || &buftype is# 'terminal' || expand('%:t') is# '.'
            return
        endif
        call s:setGitLens() 
        augroup GitLens
            au!
            au FileType * call GitLensEnable()
            au CursorMoved * call s:callSetGitLens()  
            au InsertEnter * call s:clearGitLens()
            au TermEnter * call s:clearGitLens()
        augroup END
        let g:gitlineEnabled = 1
    endf

    func! GitLensDisable()
        call s:clearGitLens()
        augroup GitLens
            au!
        augroup END
        let g:gitlineEnabled = 0
    endf

    func! s:setGitLens(...) abort
        call s:clearGitLens()
        call timer_stop(s:gitlineTimer)
        let s:gitlineTimer = -1
        let content = ''
        let cmd     = printf("cd %s && git --no-pager blame --relative-date -p -L %d,%d -- '%s'", expand('%:h'), line('.'), line('.'), expand('%:t'))
        let lines   = split(system(cmd), '\n')
        let commit_hash = split(lines[0], ' ')[0][:7]
        if  commit_hash ==# '00000000'
            let content = 'not commited yet'
        elseif commit_hash ==# 'fatal:'
            call GitLensDisable()
            return
        else
            let author    = join(split(lines[5], ' ')[1:], ' ')
            let timestamp = join(split(lines[7], ' ')[1:], ' ')
            let commit    = join(split(lines[9], ' ')[1:], ' ')
            let time      = system('date -j -f "%s" "'. timestamp .'" "+%Y-%m-%d %H:%M"')[:15]
            let content   = printf('%s %s ~ %s', author, time, commit)
        endif
        if has('nvim-0.3.2')
            call nvim_buf_set_virtual_text(bufnr(''), 1000, line('.') - 1, [['    ' . content, 'GitBlame']], {})
        else
            echo content
        endif
    endf

    func! s:clearGitLens() abort
        if has('nvim-0.3.2')
            call nvim_buf_clear_highlight(bufnr(''), 1000, 0, -1)
        endif
    endf

    func! s:callSetGitLens() abort
        if s:gitlineTimer == -1
            let s:gitlineTimer = timer_start(500, function('s:setGitLens'), {})
        else
            call timer_stop(s:gitlineTimer)
            let s:gitlineTimer = timer_start(500, function('s:setGitLens'), {})
        endif
    endf
