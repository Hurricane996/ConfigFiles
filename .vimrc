

" Get the defaults that most users want.
source $VIMRUNTIME/defaults.vim

set nobackup " do not keep a backup file, use versions instead

if &t_Co > 2 || has("gui_running")
    " Switch on highlighting the last used search pattern.
    set hlsearch
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

    " Put these in an autocmd group, so that we can delete them easily.
    augroup vimrcEx
        au!

        " For all text files set 'textwidth' to 78 characters.
        autocmd FileType text setlocal textwidth=78

    augroup END
    augroup templates
        autocmd BufNewFile *.* silent! execute '0r $HOME/.vim/templates/skeleton.'.expand("<afile>:e")
        autocmd BufNewFile * %substitute#\[:VIM_EVAL:\]\(.\{-\}\)\[:END_EVAL:\]#\=eval(submatch(1))#ge
    augroup END
else
    set autoindent		" always set autoindenting on
endif " has("autocmd")

" Add optional packages.
if has('syntax') && has('eval')
    packadd! matchit
endif
:set expandtab
:set tabstop=4
:set shiftwidth=4
:set number
" use semicolon key to go to the end of a line in normal mode
:nnoremap ; :call NSemicolon()<CR>
function NSemicolon()
    let save_pos = getpos(".")
    normal! $a;
    call setpos(".",save_pos)
endfunction
