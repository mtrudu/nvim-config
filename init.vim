let mapleader = ","

syntax on      " syntax highlighing
filetype off   " required

call plug#begin('~/.config/vim/plugged')

" theme
Plug 'sonph/onehalf', {'rtp': 'vim/'}
Plug 'morhetz/gruvbox'

"source ~/.config/nvim/plugins/theme.vim

source ~/.config/nvim/plugins/vim-test.vim
source ~/.config/nvim/plugins/projectionist.vim
source ~/.config/nvim/plugins/bufexplorer.vim
source ~/.config/nvim/plugins/nerdtree.vim
source ~/.config/nvim/plugins/nerdtree-git-plugin.vim
source ~/.config/nvim/plugins/nerdcommenter.vim
source ~/.config/nvim/plugins/fzf.vim
source ~/.config/nvim/plugins/indentline.vim
source ~/.config/nvim/plugins/vim-polyglot.vim
source ~/.config/nvim/plugins/vim-grepper.vim
source ~/.config/nvim/plugins/auto-pairs.vim
source ~/.config/nvim/plugins/vim-airline.vim
" linting
source ~/.config/nvim/plugins/ale.vim
" versioning
source ~/.config/nvim/plugins/vim-snippets.vim
source ~/.config/nvim/plugins/vim-signify.vim
source ~/.config/nvim/plugins/vim-fugitive.vim
" others
source ~/.config/nvim/plugins/vim-sensible.vim
source ~/.config/nvim/plugins/ack.vim
source ~/.config/nvim/plugins/vim-devicons.vim
source ~/.config/nvim/plugins/coc.vim
source ~/.config/nvim/plugins/omnisharp.vim
source ~/.config/nvim/plugins/copilot.vim
"source ~/.config/nvim/plugins/vdebug.vim
"source ~/.config/nvim/plugins/dap.vim
source ~/.config/nvim/plugins/vim-surround.vim
"Reload Configuration
source ~/.config/nvim/plugins/nvim-reload.vim

call plug#end()


" ===================================
" Configuration
" ===================================

"colorscheme onehalfdark
colorscheme gruvbox
highlight Normal     ctermbg=NONE guibg=NONE
highlight LineNr     ctermbg=NONE guibg=NONE
highlight SignColumn ctermbg=NONE guibg=NONE
"autocmd VimEnter * hi Normal ctermbg=NONE guibg=NONE
"autocmd vimenter * ++nested colorscheme gruvbox
set completeopt=noinsert,menuone,noselect

if (has("termguicolors"))
 set termguicolors
endif

filetype plugin indent on " required

set number relativenumber
set nu rnu

set pastetoggle=<leader>p

" TextEdit might fail if hidden is not set.
set hidden 

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=400

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" No highlighing of the cursor line
set nocursorline

set encoding=utf-8
set clipboard=unnamedplus

set nocompatible
set laststatus=3               " 2 Always show the statusline 3 global statusline
set noswapfile
set backspace=indent,eol,start " allow backspacing over everything in insert mode

set autoindent                 " always set autoindenting on
set copyindent                 " copy the previous indentation on autoindenting"
set history=10                 " keep 50 lines of command line history
set ruler                      " show the cursor position all the time
set showcmd                    " display incomplete commands
set incsearch                  " do incremental searching
set novisualbell               " turn off visual bell
set vb t_vb=".
set ttyfast                    " smoother changes

set expandtab
set shiftwidth=4               " nombre d'espace apres un '>>'
set shiftround                 " use multiple of shiftwidth when indenting with '<' and '>'"
set tabstop=4                  " nombre de place que prend une tabulation
set hlsearch
set ignorecase                 " ignore case when searching
set smarttab
set hidden
set listchars=tab:>.,trail:.,extends:#,nbsp:.
set list


" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

" ===================================
" Autocommands
" ===================================

autocmd FileType php setlocal omnifunc=phpactor#Complete

autocmd BufWritePre *.php silent! %s/[\r \t]\+$//
autocmd BufWritePre *.php :set et|retab
autocmd BufNewFile,BufRead *.twig set filetype=twig
autocmd BufNewFile,BufRead *.less set filetype=less
autocmd BufNewFile,BufRead *.html.twig set filetype=html.twig
autocmd vimenter * if !argc() || argv() == ['.'] | NERDTree | endif
" open nerdtree when open vim.  autocmd CompleteDone * pclose "
"" ===================================
"" PHP
"" ===================================
"
"" autocomplete
"let g:deoplete#enable_at_startup = 1
"
function! IPhpInsertUse()
    call PhpInsertUse()
    call feedkeys('a',  'n')
endfunction

autocmd FileType php nmap <leader>d :call PhpDocSingle()<CR><ESC>jv/\/<CR>kkk<leader>tsp<CR>
autocmd FileType php vnoremap <leader>d :call PhpDocRange()<CR>

let g:php_cs_fixer_path = "~/bin/php-cs-fixer"
let g:php_cs_fixer_rules = "@Symfony,-@PSR1,@PSR2"

let g:ale_linters = {'php': ['php', 'hack', 'langserver', 'phpmd', 'phpstan']}
let g:ale_fix_on_save = 1
let g:ale_fixers = {
\   'php': ['trim_whitespace', 'php_cs_fixer'],
\   'yaml': ['trim_whitespace'],
\   'markdown': ['trim_whitespace']
\}
   "'javascript': ['trim_whitespace', 'prettier'],

let g:php_namespace_sort_after_insert = 1

" ===================================
" Mapping
" ===================================

inoremap  <Up>     <NOP>
inoremap  <Down>   <NOP>
inoremap  <Left>   <NOP>
inoremap  <Right>  <NOP>
noremap   <Up>     <NOP>
noremap   <Down>   <NOP>
noremap   <Left>   <NOP>
noremap   <Right>  <NOP>

nmap <leader>ve :edit ~/.config/nvim/init.vim<cr>
nmap <leader>vc :edit ~/.config/nvim/coc-settings.json<cr>
nmap <leader>vr :source ~/.config/nvim/init.vim<cr>

vnoremap < <gv
vnoremap > >gv

map gf :edit <cfile><cr>

map <C-c> <leader>c<space><cr>
nmap <Leader>t :Tagbar<CR>
map <leader>y :NERDTreeToggle<CR>
map <leader>ff :NERDTreeFind<CR>
nmap <leader>gbl :Git blame<CR>
map <leader>e :set expandtab<CR>

" decode/encode base64 in a yaml
" like this:
" foo: "string to base64 encode"
map <leader>' ^f"vi"<leader>atob<CR>k<ESC>
map <leader>§ ^f"vi"<leader>btoa<CR>k<ESC>
"map <leader>¬¨√ü ^f"vi"<leader>btoa<CR>k<ESC>
map <leader>u :r !uuidgen<CR>

let $FZF_DEFAULT_COMMAND = 'rg --files --no-ignore-vcs --hidden'
nnoremap <silent> <C-P> :FZF -x<CR>

let g:SuperTabDefaultCompletionType = "<c-x><c-o>"

map <Leader>gw :cd %:p:h<cr>:!git add . && git commit -m 'WIP'<cr>
