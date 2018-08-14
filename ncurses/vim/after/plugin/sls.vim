" function for open/close all folds
function! OpenCloseFolds()
    if (&foldlevel==1)
        normal! zR
    else
        setlocal foldlevel=1
    endif
endfunction

augroup foldsls
    autocmd FileType sls setlocal foldlevel=1
    autocmd FileType sls nnoremap <silent> <F5> :call OpenCloseFolds()<CR>
augroup END
