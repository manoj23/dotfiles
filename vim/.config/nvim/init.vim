set runtimepath+=~/.config/nvim/bundles/repos/github.com/Shougo/dein.vim

if dein#load_state('~/.config/nvim/plugins')
  call dein#begin('~/.config/nvim/plugins')

  call dein#add('~/.config/nvim/bundles/repos/github.com/Shougo/dein.vim')
  call dein#add('Shougo/deoplete.nvim')
  call dein#add('Shougo/echodoc.vim')
  call dein#add('SirVer/ultisnips')
  call dein#add('arakashic/chromatica.nvim')
  call dein#add('ctrlpvim/ctrlp.vim')
  call dein#add('easymotion/vim-easymotion')
  call dein#add('haya14busa/incsearch.vim')
  call dein#add('honza/vim-snippets')
  call dein#add('matze/vim-move')
  call dein#add('mileszs/ack.vim')
  call dein#add('sjl/gundo.vim')
  call dein#add('terryma/vim-multiple-cursors')
  call dein#add('tomasr/molokai')
  call dein#add('tomtom/tcomment_vim')
  call dein#add('tpope/vim-surround')
  call dein#add('vim-scripts/DeleteTrailingWhitespace')
  call dein#add('vim-syntastic/syntastic')

  call dein#end()
  call dein#save_state()
endif

filetype plugin indent on
syntax enable
colorscheme molokai

set autoindent
set clipboard=unnamedplus
set colorcolumn=80
set inccommand=nosplit
set laststatus=1
set list listchars=tab:→\ ,trail:⋅,extends:»,precedes:«,nbsp:⎵,space:⎵
set mouse=a
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

autocmd BufWritePost * exec "DeleteTrailingWhitespace"

highlight Comment ctermfg=33
highlight Visual ctermbg=238
highlight LineNr ctermbg=16


let g:chromatica#enable_at_startup=1
let g:chromatica#responsive_mode=1
let g:chromatica#delay_ms=1
let g:ctrlp_cmd = 'CtrlPBuffer'
let g:ctrlp_buffer_func = { 'enter': 'BrightHighlightOn', 'exit': 'BrightHighlightOff', }
let g:deoplete#enable_at_startup = 1
let g:move_map_keys = 0
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_wq = 1

function BrightHighlightOn()
  hi CursorLine ctermbg=21
endfunction

function BrightHighlightOff()
  hi CursorLine ctermbg=43
endfunction
