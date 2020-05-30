" 空格作为leader
    let mapleader="z"

" 不退出执行cmd
    fun! Exec(cmd)
        exe a:cmd
        return ''
    endf
