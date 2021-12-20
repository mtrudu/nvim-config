let mapleader = ","

syntax on      " syntax highlighing
filetype off   " required

call plug#begin('~/.config/vim/plugged')

Plug 'junegunn/vim-easy-align'
Plug 'corntrace/bufexplorer'
Plug 'scrooloose/nerdtree'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'majutsushi/tagbar'
Plug 'preservim/nerdcommenter'
Plug 'terryma/vim-multiple-cursors'
Plug 'yggdroot/indentline'
Plug 'sheerun/vim-polyglot'
Plug 'Xuyuanp/nerdtree-git-plugin'

Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

" help code
Plug 'stephpy/vim-phpdoc'
Plug 'godlygeek/tabular'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-surround'
Plug 'tsaleh/vim-align'
Plug 'christianrondeau/vim-base64'
Plug 'mhinz/vim-grepper'
Plug 'jiangmiao/auto-pairs'

" theme
Plug 'tomasr/molokai'
Plug 'bling/vim-airline'
Plug 'ayu-theme/ayu-vim'
Plug 'sonph/onehalf', {'rtp': 'vim/'}

"
"" lint/cs
Plug 'stephpy/vim-php-cs-fixer'
Plug 'w0rp/ale'

"" autocompletion
Plug 'roxma/nvim-yarp'
Plug 'roxma/vim-hug-neovim-rpc'

Plug 'honza/vim-snippets'

" Versioning
Plug 'mhinz/vim-signify'
Plug 'tpope/vim-fugitive'

" others
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tpope/vim-sensible'
Plug 'mileszs/ack.vim'
Plug 'ryanoasis/vim-devicons'

Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'OmniSharp/omnisharp-vim'

Plug 'vim-vdebug/vdebug'

"Reload Configuration
Plug 'famiu/nvim-reload'

call plug#end()

nmap <leader>ve :edit ~/.config/nvim/init.vim<cr>
nmap <leader>vc :edit ~/.config/nvim/coc-settings.json<cr>
nmap <leader>vr :source ~/.config/nvim/init.vim<cr>

vnoremap < <gv
vnoremap > >gv

map gf :edit <cfile><cr>

" PHP debug
"let g:vdebug_options = {'ide_key': 'nvim-xdebug'}
let g:vdebug_options = {'break_on_open': 0}
let g:vdebug_options = {'server': 'localhost'}
let g:vdebug_options = {'port': '9000'}

"nnoremap <leader>ff :lua require('telescope.builtin').find_files({previewer = false})<cr>
"nnoremap <leader>fs :sp<cr><cmd>lua require('telescope.builtin').find_files({previewer = false})<cr>
"nnoremap <leader>fv :vsp<cr><cmd>lua require('telescope.builtin').find_files({previewer = false})<cr>
"nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
"nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>
"nnoremap <leader>be <cmd>lua require('telescope.builtin').buffers({previewer = false})<cr>
"nnoremap <leader>bs :sp<cr><cmd>lua require('telescope.builtin').buffers({previewer = false})<cr>
"nnoremap <leader>bv :vsp<cr><cmd>lua require('telescope.builtin').buffers({previewer = false})<cr>
nmap <leader>ov :vsp<CR><Plug>(coc-definition)
nmap <leader>os :sp<CR><Plug>(coc-definition)

"lua << EOF
"require('telescope').setup{
    "defaults = {
        "file_sorter =  require'telescope.sorters'.get_fuzzy_file,
        "previewer = false,
        "color_devicons = true,
        "set_env = { ['COLORTERM'] = 'truecolor' }, -- default = nil,
        "borderchars = { '─', '│', '─', '│', '╭', '╮', '╯', '╰' },
        "file_previewer = require'telescope.previewers'.vim_buffer_cat.new,
        "grep_previewer = require'telescope.previewers'.vim_buffer_vimgrep.new,
        "qflist_previewer = require'telescope.previewers'.vim_buffer_qflist.new,
    "}
"}
"EOF

"autocmd BufEnter * call ncm2#enable_for_buffer()
set completeopt=noinsert,menuone,noselect
set shortmess+=c
"inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
"inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

filetype plugin indent on " required

set pastetoggle=<leader>p
set tags+=vendor.tags

" ===================================
" Configuration
" ===================================

set nocursorline
set encoding=utf-8
set clipboard=unnamedplus

set nocompatible
set laststatus=2               " Always show the statusline
set nobackup                   " delete backup
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

" theme
if (has("termguicolors"))
 set termguicolors
endif

"colorscheme molokai
"let ayucolor="mirage" " for mirage version of theme
"let ayucolor="dark"   " for dark version of theme
"colorscheme ayu

let g:airline_powerline_fonts = 1
let g:webdevicons_enable_nerdtree = 1
let g:webdevicons_enable_airline_tabline = 1
let g:webdevicons_enable_airline_statusline = 1
let g:webdevicons_enable_ctrlp = 1
let g:webdevicons_enable = 1
colorscheme onehalfdark
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols = {} " needed
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['js'] = ''
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['ts'] = ''
"let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['js'] = 'Ô£ø√º√≠¬©'

let g:airline_theme='onehalfdark'

let g:OmniSharp_server_stdio = 0

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

" PHPACTOR

"nmap <Leader>mm :call phpactor#ContextMenu()<CR>
"nmap <Leader>ns :call phpactor#UseAdd()<CR>
"nmap <Leader>oo :call phpactor#GotoDefinition()<CR>
"nmap <Leader>os :call phpactor#GotoDefinitionHsplit()<CR>
"nmap <Leader>ov :call phpactor#GotoDefinitionVsplit()<CR>
"nmap <Leader>n :call phpactor#ClassNew()<CR>
" Extract expression (normal mode)
"nmap <silent><Leader>ee :call phpactor#ExtractExpression(v:false)<CR>

" Extract expression from selection
"vmap <silent><Leader>ee :<C-U>call phpactor#ExtractExpression(v:true)<CR>

nmap <leader>oo <Plug>(coc-definition)
nmap <leader>ov :vsp<CR><Plug>(coc-definition)
nmap <leader>os :sp<CR><Plug>(coc-definition)

nmap <leader>od <Plug>(coc-type-definition)
nmap <leader>oi <Plug>(coc-implementation)
nmap <leader>or <Plug>(coc-references)

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

" tags
nmap <leader>k <c-]>
nmap <leader>j <c-]>
nmap <leader>h :tprevious<CR>
nmap <leader>l :tnext<CR>

let $FZF_DEFAULT_COMMAND = 'rg --files --no-ignore-vcs --hidden'
nnoremap <silent> <C-P> :FZF -x<CR>

let g:SuperTabDefaultCompletionType = "<c-x><c-o>"

map <C-f> :Grepper<cr>

let g:grepper               = {}
let g:grepper.highlight     = 1
let g:grepper.simple_prompt = 1
let g:grepper.dir = 'repo,cwd'
let g:grepper.side_cmd = 'botright vnew'

runtime plugin/grepper.vim

let g:grepper.tools = ['rg', 'ag']
let g:grepper.ag = { 'grepprg': 'ag --vimgrep --skip-vcs-ignores --hidden' }
let g:grepper.rg = { 'grepprg': 'rg --vimgrep --no-heading --no-hidden --smart-case $* .' }

set grepformat=%f:%l:%c:%m,%f:%l:%m

""" COCVIM TEST
if executable('intelephense')
  augroup LspPHPIntelephense
    au!
    au User lsp_setup call lsp#register_server({
        \ 'name': 'intelephense',
        \ 'cmd': {server_info->[&shell, &shellcmdflag, 'intelephense --stdio']},
        \ 'whitelist': ['php'],
        \ 'initialization_options': {'storagePath': '/tmp/intelephense'},
        \ 'workspace_config': {
        \   'intelephense': {
        \     'files': {
        \       'maxSize': 1000000,
        \       'associations': ['*.php', '*.phtml'],
        \       'exclude': [],
        \     },
        \     'completion': {
        \       'insertUseDeclaration': v:true,
        \       'fullyQualifyGlobalConstantsAndFunctions': v:false,
        \       'triggerParameterHints': v:true,
        \       'maxItems': 100,
        \     },
        \     'format': {
        \       'enable': v:true
        \     },
        \   },
        \ }
        \})
  augroup END
endif

" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("nvim-0.5.0") || has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB> coc#refresh()
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

imap <silent><script><expr> <C-j> copilot#Accept("\<CR>")
let g:copilot_no_tab_map = v:true


function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <expr><Tab> coc#refresh()
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif
set termguicolors

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

 "Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>
"autocmd User CocOpenFloat call nvim_win_set_config(g:coc_last_float_win, {'relative': 'editor', 'row': 0, 'col': 0})
"autocmd User CocOpenFloat call nvim_win_set_width(g:coc_last_float_win, 9999)

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json,php setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> for scroll float windows/popups.
" Note coc#float#scroll works on neovim >= 0.4.0 or vim >= 8.2.0750
"nnoremap <nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
"nnoremap <nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
"inoremap <nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
"inoremap <nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"

" NeoVim-only mapping for visual mode scroll
" Useful on signatureHelp after jump placeholder of snippet expansion
"if has('nvim')
  "vnoremap <nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#nvim_scroll(1, 1) : "\<C-f>"
  "vnoremap <nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#nvim_scroll(0, 1) : "\<C-b>"
"endif

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>

""" END COCVIM TEST

map <Leader>gw :cd %:p:h<cr>:!git add . && git commit -m 'WIP'<cr>
