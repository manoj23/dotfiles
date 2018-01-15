set runtimepath+=~/.config/nvim/bundles/repos/github.com/Shougo/dein.vim

if dein#load_state('~/.config/nvim/plugins')
  call dein#begin('~/.config/nvim/plugins')

  call dein#add('~/.config/nvim/bundles/repos/github.com/Shougo/dein.vim')

  call dein#load_dict({
  \ 'Shougo/deoplete.nvim': { 'on_i': 1, 'on_ft': ['c', 'cpp'] },
  \ 'Shougo/echodoc.vim': { 'on_i': 1, 'on_ft': ['c', 'cpp'] },
  \ 'SirVer/ultisnips': { 'name': 'ultisnips', 'on_i': 1, 'on_ft': ['c', 'cpp', 'sh' ] },
  \ 'arakashic/chromatica.nvim': { 'on_ft': ['c', 'cpp'] },
  \ 'easymotion/vim-easymotion': { 'on_ft': ['c', 'cpp'] },
  \ 'haya14busa/incsearch.vim': { 'on_ft': ['c', 'cpp'] },
  \ 'haya14busa/vim-textobj-function-syntax': { 'on_ft': ['c', 'cpp'] },
  \ 'honza/vim-snippets': { 'depends': 'ultisnip' },
  \ 'junegunn/fzf': { 'name': 'fzf', 'build': './install', 'merged': 0 },
  \ 'junegunn/fzf.vim': { 'depends': 'fzf' },
  \ 'kana/vim-textobj-function': { 'on_ft': ['c', 'cpp'] },
  \ 'kana/vim-textobj-user': { 'on_ft': ['c', 'cpp'] },
  \ 'LnL7/vim-nix': { 'on_ft': ['nix'] },
  \ 'matze/vim-move': {},
  \ 'mileszs/ack.vim': { 'on_ft': ['c', 'cpp'] },
  \ 'sjl/gundo.vim': { 'on_ft': ['c', 'cpp'] },
  \ 'terryma/vim-multiple-cursors': {},
  \ 'tomasr/molokai': { 'merged': 0 },
  \ 'tomtom/tcomment_vim': { 'on_ft': ['c', 'cpp', 'sh', 'vim' ] },
  \ 'tpope/vim-abolish': {},
  \ 'tpope/vim-surround': { 'on_ft': ['c', 'cpp'] },
  \ 'vim-scripts/DeleteTrailingWhitespace': {},
  \ 'vim-syntastic/syntastic': { 'on_ft': ['c', 'cpp', 'sh' ] },
  \ 'xolox/vim-easytags': { 'on_ft': ['c', 'cpp'], 'depends': 'vim-misc' },
  \ 'xolox/vim-misc': { 'name': 'vim-misc', 'on_ft': ['c', 'cpp'] },
  \ 'tweekmonster/deoplete-clang2': { 'on_i': 1, 'on_ft': ['c', 'cpp'] }
  \ })

  call dein#end()
  call dein#save_state()
endif

filetype plugin indent on
syntax enable
colorscheme molokai

set autoindent
set grepprg=rg\ --vimgrep
set clipboard=unnamedplus
set colorcolumn=80
set inccommand=nosplit
set laststatus=1
set list listchars=tab:→\ ,trail:•,extends:»,precedes:«,nbsp:¬,space:⋅
set mouse=a
set noshowmode
set nu
set showmatch
set switchbuf=usetab
set syntax=on
set undodir=$HOME/.config/nvim/undo/
set undofile
set undolevels=1000
set undoreload=10000
vmap <C-Down> <Plug>MoveBlockDown
vmap <C-Up> <Plug>MoveBlockUp
nmap <C-Down> <Plug>MoveLineDown
nmap <C-Up> <Plug>MoveLineUp
nmap <C-p> :Files<CR>
nnoremap <C-s> :w<CR>
nnoremap <F2> :bp<CR>
nnoremap <F3> :bn<CR>
nnoremap <F4> :bd<CR>
nnoremap <F5> :tabp<CR>
nnoremap <F6> :tabn<CR>
nnoremap <F7> :tabc<CR>
nnoremap <F8> :SyntasticToggleMode<CR>
nnoremap <F9> :set hlsearch!<CR>
nnoremap <F12> :set list!<CR>:redraw!<CR>

highlight Comment ctermfg=33
highlight Visual ctermbg=238
highlight LineNr ctermbg=16

let g:ackprg = 'rg --vimgrep'
let g:chromatica#enable_at_startup=1
let g:chromatica#responsive_mode=1
let g:chromatica#delay_ms=1
let g:chromatica#libclang_path=split(system("clang --print-file-name=libclang.so"), '\n')[0]
let g:deoplete#enable_at_startup = 1
let g:easytags_async = 1
let g:easytags_dynamic_files = 1
let g:easytags_events = ['BufWritePost']
let g:easytags_include_members = 1
let g:move_map_keys = 0
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_wq = 1

" http://vim.wikia.com/wiki/Search_across_multiple_lines
function! SearchMultiLine(bang, ...)
 if a:0 > 0
   let sep = (a:bang) ? '\_W\+' : '\_s\+'
   let @/ = join(a:000, sep)
 endif
endfunction
command! -bang -nargs=* -complete=tag S call SearchMultiLine(<bang>0, <f-args>)|normal! /<C-R>/<CR>
command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>), 1, <bang>0)
