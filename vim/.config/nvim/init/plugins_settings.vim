let g:ackprg = 'rg --vimgrep'
let g:move_map_keys = 0
let g:tcomment#commentstring_c = '// %s'
let g:coq_settings = { 'display.icons.mode': 'none' }
let g:coq_settings = { 'auto_start': v:true }
let g:ale_fixers = { '*': ['remove_trailing_lines', 'trim_whitespace'], 'rust': ['rustfmt'] }
