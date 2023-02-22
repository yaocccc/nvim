" TODO 待移除该vim配置

cnoremap <expr> <Tab> <SID>in_context(0) ? <SID>start_wilder() : '<Tab>'
cnoremap <expr> <Down> <SID>in_context(1) ? wilder#next() : '<Down>'
cnoremap <expr> <Up> <SID>in_context(1) ? wilder#previous() : '<Up>'

let s:wilder_started = 0
autocmd CmdlineLeave * let s:wilder_started = 0

function! s:start_wilder() abort
  let s:wilder_started = 1
  return wilder#next()
endfunction

function! s:in_context(check_started) abort
  if a:check_started && !s:wilder_started
    return 0
  endif

  return wilder#in_context()
endfunction
