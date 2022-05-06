Plug 'mhinz/vim-grepper', { 'on': ['Grepper', '<plug>(GrepperOperator)'] }

runtime plugin/grepper.vim

set grepformat=%f:%l:%c:%m,%f:%l:%m

let g:grepper               = {}
let g:grepper.highlight     = 1
let g:grepper.simple_prompt = 1
let g:grepper.dir = 'repo,cwd'
let g:grepper.side_cmd = 'botright vnew'
let g:grepper.tools = ['rg', 'ag']
let g:grepper.ag = { 'grepprg': 'ag --vimgrep --skip-vcs-ignores --hidden' }
let g:grepper.rg = { 'grepprg': 'rg --vimgrep --no-heading --no-hidden --smart-case $* .' }

map <C-f> :Grepper<cr>
