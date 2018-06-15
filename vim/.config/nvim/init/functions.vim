" http://vim.wikia.com/wiki/Search_across_multiple_lines
function! SearchMultiLine(bang, ...)
 if a:0 > 0
   let sep = (a:bang) ? '\_W\+' : '\_s\+'
   let @/ = join(a:000, sep)
 endif
endfunction
command! -bang -nargs=* -complete=tag S call SearchMultiLine(<bang>0, <f-args>)|normal! /<C-R>/<CR>
command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>), 1, <bang>0)

function! SetSpacing(...)
  if a:1 == 2
    set tabstop=2 softtabstop=2 shiftwidth=2
  elseif a:1 == 4
    set tabstop=4 softtabstop=4 shiftwidth=4
  elseif a:1 == 8
    set tabstop=8 softtabstop=8 shiftwidth=8
  endif
endfunction

function! UseTab(...)
  if a:0 > 0
    call SetSpacing(a:1)
  endif
  set noexpandtab
endfunction
function! UseSpace(...)
  if a:0 > 0
    call SetSpacing(a:1)
  endif
  set expandtab
endfunction

command! -bang -nargs=* UseTab call UseTab(<f-args>)
command! -bang -nargs=* UseSpace call UseSpace(<f-args>)
