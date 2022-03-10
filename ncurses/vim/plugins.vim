" Gist
let g:gist_show_privates = 1
let g:gist_post_private = 1
let g:gist_detect_filetype = 1
let g:gist_clip_command = 'xclip -selection clipboard'

" GitGutter
let g:gitgutter_enabled = 0
let g:gitgutter_map_keys = 0
" Open the Sign Column and enable GitGutter
function! TurnGitGutterOnOff()
    if ( &signcolumn ==# 'no' || &signcolumn ==# 'auto' )
        set signcolumn=yes
        set updatetime=250
        GitGutterEnable
    else
        set signcolumn=no
        set updatetime=4000
        GitGutterDisable
    endif
endfunction
" TurnGitGutterOnOff()
noremap <silent> <F6> :call TurnGitGutterOnOff()<CR>
