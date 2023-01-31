let s:dein_base = '~/.cache/dein'
let s:dein_src = '~/.cache/dein/repos/github.com/Shougo/dein.vim'
execute 'set runtimepath+=' . s:dein_src

let ft1 = ['c', 'cpp']
let ft2 = ft1 + ['python', 'sh', 'java']
let ft3 = ft2 + ['rust', 'vim', 'bitbake']

if dein#load_state(s:dein_base)
  call dein#begin(s:dein_base)

  call dein#add(s:dein_src)

  call dein#load_dict({
  \ 'Shougo/echodoc.vim': { 'on_i': 1, 'on_ft': ft1 },
  \ 'SirVer/ultisnips': { 'name': 'ultisnips', 'on_i': 1, 'on_ft': ft2 },
  \ 'bps/vim-textobj-python': { 'depends': 'vim-textobj-user', 'on_ft': ['python'] },
  \ 'easymotion/vim-easymotion': { 'on_ft': ft1 },
  \ 'haya14busa/incsearch.vim': { 'on_ft': ft1 },
  \ 'haya14busa/vim-textobj-function-syntax': { 'on_ft': ft2 },
  \ 'honza/vim-snippets': { 'depends': 'ultisnip' },
  \ 'jiangmiao/auto-pairs':  { 'on_ft': ft2 },
  \ 'junegunn/fzf': { 'name': 'fzf', 'build': './install', 'merged': 0 },
  \ 'junegunn/fzf.vim': { 'depends': 'fzf' },
  \ 'kana/vim-textobj-function': { 'on_ft': ft2 },
  \ 'kana/vim-textobj-user': { 'name': 'vim-textobj-user', 'on_ft': ft2 },
  \ 'kergoth/vim-bitbake': { 'on_ft': ['bitbake'], 'merge_ftdetect': 'v:true' },
  \ 'LnL7/vim-nix': { 'on_ft': ['nix'] },
  \ 'matze/vim-move': {},
  \ 'mileszs/ack.vim': { 'on_ft': ft1 },
  \ 'ms-jpq/coq_nvim': { 'on_ft': ft2, 'branch': 'coq' },
  \ 'ms-jpq/coq.artifacts': { 'on_ft': ft2, 'branch': 'artifacts' },
  \ 'ms-jpq/coq.thirdparty': { 'on_ft': ft2, 'branch': '3p' },
  \ 'nvim-treesitter/nvim-treesitter': { 'on_ft': ft2 },
  \ 'neovim/nvim-lspconfig': { 'on_ft': ft2 },
  \ 'rust-lang/rust.vim': { 'on_ft': ['rust'] },
  \ 'sjl/gundo.vim': { 'on_ft': ft2 },
  \ 'terryma/vim-multiple-cursors': {},
  \ 'tomasr/molokai': { 'merged': 0 },
  \ 'tomtom/tcomment_vim': { 'on_ft': ft3 },
  \ 'tpope/vim-abolish': { 'on_ft': ft1 },
  \ 'tpope/vim-surround': { 'on_ft': ft3 },
  \ 'tpope/vim-obsession': { 'on_ft': ft3 },
  \ 'udalov/kotlin-vim': { 'on_ft': ['kotlin'] },
  \ 'vim-scripts/DeleteTrailingWhitespace': {},
  \ 'w0rp/ale': { 'on_ft': ft2 },
  \ 'xolox/vim-misc': { 'name': 'vim-misc', 'on_ft': ft1 },
  \ 'peterhoeg/vim-qml': { 'on_ft': ['qml'] }
  \ })

  call dein#end()
  call dein#save_state()
endif
