Plug 'vim-test/vim-test'

let test#php#phpunit#executable = 'vendor/bin/phpunit --testdox'
"let test#neovim#start_normal = 1
let test#neovim#start_normal = 1
let test#preserve_screen = 1

nmap <leader>tn :TestNearest<CR>
nmap <leader>tf :TestFile<CR>
nmap <leader>ts :TestSuite<CR>
nmap <leader>tl :TestLast<CR>
nmap <leader>tv :TestVisit<CR>

augroup AutoDeleteTestTermBuffers
    autocmd!
    autocmd BufLeave term://*phpunit* bdelete!
augroup END
