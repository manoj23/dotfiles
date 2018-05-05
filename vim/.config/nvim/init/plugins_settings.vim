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
