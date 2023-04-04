Plug 'vim-vdebug/vdebug'

" PHP debug
"let g:vdebug_options = {'ide_key': 'nvim-xdebug'}
"let g:vdebug_options = {'break_on_open': 0}
"let g:vdebug_options = {'server': 'localhost'}
let g:vdebug_options = {}
let g:vdebug_options = {'port': '9000'}

let g:vdebug_keymap = {}
let g:vdebug_keymap['run'] = '<C-y>'
