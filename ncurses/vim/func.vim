" modify selected text using combining diacritics
" http://vim.wikia.com/wiki/Create_underlines,_overlines,_and_strikethroughs_using_combining_characters
command! -range -nargs=0 Overline        call s:CombineSelection(<line1>, <line2>, '0305')
command! -range -nargs=0 Underline       call s:CombineSelection(<line1>, <line2>, '0332')
command! -range -nargs=0 DoubleUnderline call s:CombineSelection(<line1>, <line2>, '0333')
command! -range -nargs=0 Strikethrough   call s:CombineSelection(<line1>, <line2>, '0336')
" CombineSeleccion()
function! s:CombineSelection(line1, line2, cp)
    execute 'let char = "\u'.a:cp.'"'
    execute a:line1.','.a:line2.'s/\%V[^[:cntrl:]]/&'.char.'/ge'
endfunction

" GPG
" http://vim.wikia.com/wiki/Encryption
augroup encrypted
    au!
    autocmd BufReadPre,FileReadPre *.asc set viminfo=
    autocmd BufReadPre,FileReadPre *.asc set noswapfile noundofile nobackup
    autocmd BufWritePre,FileWritePre *.asc '[,']!gpg --default-recipient-self -ae 2>/dev/null
    autocmd BufWritePost,FileWritePost *.asc u
augroup END

" sorting words in line
function! SortInLine()
    call setline('.', join(sort(split(getline('.'), ' ')), " "))
endfunction

" Display output of shell commands in new window
" http://vim.wikia.com/wiki/Display_output_of_shell_commands_in_new_window
command! -complete=shellcmd -nargs=+ Shell call s:RunShellCommand(<q-args>)
function! s:RunShellCommand(cmdline)
    echo a:cmdline
    let expanded_cmdline = a:cmdline
    for part in split(a:cmdline, ' ')
       if part[0] =~ '\v[%#<]'
          let expanded_part = fnameescape(expand(part))
          let expanded_cmdline = substitute(expanded_cmdline, part, expanded_part, '')
       endif
    endfor
    botright new
    setlocal buftype=nofile bufhidden=wipe nobuflisted noswapfile nowrap
    execute '$read !'. expanded_cmdline
    setlocal nomodifiable
    1
endfunction

fu! MyTabLabel(n)
let buflist = tabpagebuflist(a:n)
let winnr = tabpagewinnr(a:n)
let string = fnamemodify(bufname(buflist[winnr - 1]), ':t')
return empty(string) ? '[unnamed]' : string
endfu

" Based on mkitt/tabline.vim
let g:loaded_tabline_vim = 1

function! Tabline()
  let s = '   '
  for i in range(tabpagenr('$'))
    let tab = i + 1
    let winnr = tabpagewinnr(tab)
    let buflist = tabpagebuflist(tab)
    let bufnr = buflist[winnr - 1]
    let bufname = bufname(bufnr)
    let bufmodified = getbufvar(bufnr, "&mod")

    let s .= '%' . tab . 'T'
    let s .= (tab == tabpagenr() ? '%#TabLineSel#' : '%#TabLine#')
    let s .= ' ' . tab .':'
    let s .= (bufname != '' ? '['. fnamemodify(bufname, ':t') . '] ' : '[No Name] ')

    if bufmodified
      let s .= '[+] '
    endif
  endfor

  let s .= '%#TabLineFill#'
  if (exists("g:tablineclosebutton"))
    let s .= '%=%999XX'
  endif
  return s
endfunction

set tabline=%!Tabline()

" Exit paste mode when leave Insert mode
" https://stackoverflow.com/a/36230409
function Paste_from_clipboard()
    set paste
    startinsert
endfunction

autocmd InsertLeave * set nopaste

map <Leader>i :call Paste_from_clipboard()<CR>

" split lines
" https://superuser.com/a/611420
function! BreakHere()
    s/^\(\s*\)\(.\{-}\)\(\s*\)\(\%#\)\(\s*\)\(.*\)/\1\2\r\1\4\6
    call histdel("/", -1)
endfunction
" BreakHere()
" nnoremap j :<C-u>call BreakHere()<CR>
