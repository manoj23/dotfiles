let g:ackprg = 'rg --vimgrep'
let g:move_map_keys = 0
let g:tcomment#commentstring_c = '// %s'
let g:coq_settings = { 'display.icons.mode': 'none' }
let g:coq_settings = { 'auto_start': v:true }
let g:coq_settings = { 'clients.tmux.all_session': v:false }
let g:ale_fixers = { '*': ['remove_trailing_lines', 'trim_whitespace'], 'rust': ['rustfmt'] }
let g:echodoc#enable_at_startup = 1
let g:echodoc#type = 'virtual'
let g:echodoc#floating_config = {'border': 'single'}
highlight link EchoDocFloat Pmenu
