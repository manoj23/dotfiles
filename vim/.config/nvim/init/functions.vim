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
  exe "set tabstop=".a:1." softtabstop=".a:1" shiftwidth=".a:1
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
