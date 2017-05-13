set runtimepath+=~/.config/nvim/bundles/repos/github.com/Shougo/dein.vim

if dein#load_state('~/.config/nvim/plugins')
  call dein#begin('~/.config/nvim/plugins')

  call dein#add('~/.config/nvim/bundles/repos/github.com/Shougo/dein.vim')
  call dein#add('tomasr/molokai')
  call dein#add('tomtom/tcomment_vim')
  call dein#add('vim-syntastic/syntastic')
  call dein#add('Shougo/deoplete.nvim')
  call dein#add('arakashic/chromatica.nvim')
  call dein#add('vim-scripts/DeleteTrailingWhitespace')
  call dein#add('tpope/vim-surround')
  call dein#add('kien/ctrlp.vim')
  call dein#add('SirVer/ultisnips')
  call dein#add('honza/vim-snippets')
  call dein#add('easymotion/vim-easymotion')

  call dein#end()
  call dein#save_state()
endif

filetype plugin indent on
syntax enable
colorscheme molokai

set nu
set mouse=a
set showmatch
set switchbuf=usetab
set autoindent
set syntax=on
set laststatus=1
set clipboard=unnamedplus
nnoremap <F2> :bp<CR>
nnoremap <F3> :bn<CR>
nnoremap <F4> :bd<CR>
nnoremap <F5> :tabp<CR>
nnoremap <F6> :tabn<CR>
nnoremap <F7> :tabc<CR>
nnoremap <F8> :SyntasticToggleMode<CR>
nnoremap <F9> :set hlsearch<CR>
nnoremap <F10> :nohlsearch<CR>
nnoremap <F12> :set list!<CR>:redraw!<CR>

autocmd BufWritePost * exec "DeleteTrailingWhitespace"

highlight Visual ctermbg=226
highlight LineNr ctermbg=16
set list listchars=tab:→\ ,trail:⋅,extends:»,precedes:«,nbsp:⎵,space:⎵

set colorcolumn=80

set undofile
set undodir=$HOME/.config/nvim/undo/
set undolevels=1000
set undoreload=10000

let g:chromatica#enable_at_startup=1
let g:chromatica#responsive_mode=1
let g:chromatica#delay_ms=1
let g:deoplete#enable_at_startup = 1
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_wq = 1
