set runtimepath+=~/.config/nvim/bundles/repos/github.com/Shougo/dein.vim

if dein#load_state('~/.config/nvim/plugins')
  call dein#begin('~/.config/nvim/plugins')

  call dein#add('~/.config/nvim/bundles/repos/github.com/Shougo/dein.vim')

  call dein#load_dict({
  \ 'Shougo/echodoc.vim': { 'on_i': 1, 'on_ft': ['c', 'cpp'] },
  \ 'SirVer/ultisnips': { 'name': 'ultisnips', 'on_i': 1, 'on_ft': ['c', 'cpp', 'python', 'sh' ] },
  \ 'arakashic/chromatica.nvim': { 'on_ft': ['c', 'cpp'] },
  \ 'bps/vim-textobj-python': { 'depends': 'vim-textobj-user', 'on_ft': ['python'] },
  \ 'easymotion/vim-easymotion': { 'on_ft': ['c', 'cpp'] },
  \ 'haya14busa/incsearch.vim': { 'on_ft': ['c', 'cpp'] },
  \ 'haya14busa/vim-textobj-function-syntax': { 'on_ft': ['c', 'cpp', 'python', 'sh'] },
  \ 'honza/vim-snippets': { 'depends': 'ultisnip' },
  \ 'jiangmiao/auto-pairs':  { 'on_ft': ['c', 'cpp', 'python', 'sh'] },
  \ 'junegunn/fzf': { 'name': 'fzf', 'build': './install', 'merged': 0 },
  \ 'junegunn/fzf.vim': { 'depends': 'fzf' },
  \ 'kana/vim-textobj-function': { 'on_ft': ['c', 'cpp', 'python', 'sh'] },
  \ 'kana/vim-textobj-user': { 'name': 'vim-textobj-user', 'on_ft': ['c', 'cpp', 'python', 'sh'] },
  \ 'kergoth/vim-bitbake': { 'on_ft': ['bitbake'] },
  \ 'LnL7/vim-nix': { 'on_ft': ['nix'] },
  \ 'matze/vim-move': {},
  \ 'mileszs/ack.vim': { 'on_ft': ['c', 'cpp'] },
  \ 'rust-lang/rust.vim': { 'on_ft': ['rust'] },
  \ 'sjl/gundo.vim': { 'on_ft': ['c', 'cpp', 'python', 'sh'] },
  \ 'terryma/vim-multiple-cursors': {},
  \ 'tomasr/molokai': { 'merged': 0 },
  \ 'tomtom/tcomment_vim': { 'on_ft': ['c', 'cpp', 'java', 'python', 'rust', 'sh', 'vim'] },
  \ 'tpope/vim-abolish': {},
  \ 'tpope/vim-surround': { 'on_ft': ['bitbake', 'c', 'cpp', 'sh', 'python'] },
  \ 'tpope/vim-obsession': { 'on_ft': ['bitbake', 'c', 'cpp', 'java', 'sh', 'python'] },
  \ 'udalov/kotlin-vim': { 'on_ft': ['kotlin'] },
  \ 'vim-scripts/DeleteTrailingWhitespace': {},
  \ 'w0rp/ale': { 'on_ft': ['c', 'cpp', 'sh' ] },
  \ 'xolox/vim-misc': { 'name': 'vim-misc', 'on_ft': ['c', 'cpp'] },
  \ 'peterhoeg/vim-qml': { 'on_ft': ['qml'] }
  \ })

  call dein#end()
  call dein#save_state()
endif
