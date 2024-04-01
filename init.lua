require("plugins")

-- Set leader key
vim.g.mapleader = ' '

-- Colorscheme and highlights
vim.cmd 'colorscheme gruvbox'
vim.cmd [[highlight Normal ctermbg=NONE guibg=NONE]]
vim.cmd [[highlight LineNr ctermbg=NONE guibg=NONE]]
vim.cmd [[highlight SignColumn ctermbg=NONE guibg=NONE]]

-- General settings
vim.o.completeopt = 'noinsert,menuone,noselect'
vim.o.termguicolors = true
vim.cmd 'filetype plugin indent on'
vim.wo.number = true
vim.wo.relativenumber = true
vim.o.pastetoggle = '<leader>p'
vim.o.hidden = true
vim.o.nobackup = true
vim.o.nowritebackup = true
vim.o.cmdheight = 2
vim.o.updatetime = 400
vim.o.shortmess = vim.o.shortmess .. 'c'
vim.o.nocursorline = true
vim.o.encoding = 'utf-8'
vim.o.clipboard = 'unnamedplus'
vim.o.nocompatible = true
vim.o.laststatus = 3
vim.o.swapfile = false
vim.o.backspace = 'indent,eol,start'
vim.o.autoindent = true
vim.o.copyindent = true
vim.o.history = 10
vim.o.ruler = true
vim.o.showcmd = true
vim.o.incsearch = true
vim.o.visualbell = false
vim.o.ttyfast = true
vim.o.expandtab = true
vim.o.shiftwidth = 4
vim.o.shiftround = true
vim.o.tabstop = 4
vim.o.hlsearch = true
vim.o.ignorecase = true
vim.o.smarttab = true
vim.o.list = true
vim.o.listchars = 'tab:>.,trail:.,extends:#,nbsp:.'
if vim.fn.has('mouse') == 1 then
    vim.o.mouse = 'a'
end

-- Autocommands
vim.api.nvim_create_autocmd("FileType", {
    pattern = "php",
    callback = function()
        vim.bo.omnifunc = 'phpactor#Complete'
        vim.api.nvim_buf_set_keymap(0, 'v', '<leader>d', ':call PhpDocRange()<CR>', {silent = true})
    end,
})

-- Other specific filetype settings can be added in a similar manner

local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

map('n', '<leader>ve', ':edit ~/.config/nvim/init.lua<CR>', opts)
map('n', '<leader>vc', ':edit ~/.config/nvim/coc-settings.json<CR>', opts)
map('n', '<leader>vr', ':source ~/.config/nvim/init.lua<CR>', opts)
map('n', '<leader>t', ':Tagbar<CR>', opts)
map('n', '<leader>y', ':NERDTreeToggle<CR>', opts)
map('n', '<leader>ff', ':NERDTreeFind<CR>', opts)
map('n', '<leader>e', ':set expandtab<CR>', opts)
map('n', '<leader>u', ':r !uuidgen<CR>', opts)
map('n', '<Leader>gw', ':cd %:p:h<CR>:!git add . && git commit -m "WIP"<CR>', opts)

vim.fn.setenv("FZF_DEFAULT_COMMAND", "rg --files --no-ignore-vcs --hidden")
map('n', '<C-P>', ':FZF -x<CR>', opts)


-- Disable arrow keys in insert and normal mode
local no_arrow = '<nop>'
map('i', '<Up>', no_arrow, opts)
map('i', '<Down>', no_arrow, opts)
map('i', '<Left>', no_arrow, opts)
map('i', '<Right>', no_arrow, opts)
map('n', '<Up>', no_arrow, opts)
map('n', '<Down>', no_arrow, opts)
map('n', '<Left>', no_arrow, opts)
map('n', '<Right>', no_arrow, opts)

-- Custom PHP configuration
vim.g.php_cs_fixer_path = '~/bin/php-cs-fixer'
vim.g.php_cs_fixer_rules = '@Symfony,-@PSR1,@PSR2'
vim.g.ale_linters = {
    php = {'php', 'hack', 'langserver', 'phpmd', 'phpstan'},
    javascript = {'eslint'},
    typescript = {'eslint', 'tsserver', 'prettier'}
}
vim.g.ale_fix_on_save = 1
vim.g.ale_fixers = {
    php = {'trim_whitespace', 'php_cs_fixer'},
    yaml = {'trim_whitespace'},
    markdown = {'trim_whitespace'},
    javascript = {'eslint'},
    typescript = {'eslint', 'prettier'}
}
vim.g.php_namespace_sort_after_insert = 1


-- Set vim-test options
vim.g['test#php#phpunit#executable'] = 'vendor/bin/phpunit --testdox'
vim.g['test#neovim#start_normal'] = 1
vim.g['test#preserve_screen'] = 1

map('n', '<leader>tn', ':TestNearest<CR>', opts)
map('n', '<leader>tf', ':TestFile<CR>', opts)
map('n', '<leader>ts', ':TestSuite<CR>', opts)
map('n', '<leader>tl', ':TestLast<CR>', opts)
map('n', '<leader>tv', ':TestVisit<CR>', opts)

-- Autocommand to auto-delete test terminal buffers
vim.api.nvim_create_augroup('AutoDeleteTestTermBuffers', {})
vim.api.nvim_create_autocmd('BufLeave', {
    group = 'AutoDeleteTestTermBuffers',
    pattern = 'term://*phpunit*',
    command = 'bdelete!',
})

vim.g.projectionist_heuristics = {
    ["bin/console"] = {
        ["src/*.php"] = {
            type = "source",
            alternate = {
                "tests/Functional/{}Test.php",
                "tests/Integration/{}Test.php",
                "tests/Unit/{}Test.php",
            }
        },
        ["tests/Functional/*Test.php"] = {
            type = "test",
            alternate = "src/{}.php",
        },
        ["tests/Integration/*Test.php"] = {
            type = "test",
            alternate = "src/{}.php",
        },
        ["tests/Unit/*Test.php"] = {
            type = "test",
            alternate = "src/{}.php",
        },
    }
}

-- `vim-grepper` options
vim.g.grepper = {
    highlight = 1,
    simple_prompt = 1,
    dir = 'repo,cwd',
    side_cmd = 'botright vnew',
    tools = {'rg', 'ag'},
    ag = { grepprg = 'ag --vimgrep --skip-vcs-ignores --hidden' },
    rg = { grepprg = 'rg --vimgrep --no-heading --no-hidden --smart-case $* .' }
}

-- Set `grepformat`
vim.o.grepformat = '%f:%l:%c:%m,%f:%l:%m'

-- Key mappings
map('n', '<C-f>', ':Grepper<cr>', opts)

map('n', '<leader>gbl', ':Git blame<CR>', opts)
map('n', '<leader>gitw', ':Gwrite<CR>', opts)
map('n', '<leader>gitr', ':Gread<CR>', opts)
map('n', '<leader>gitc', ':Git commit<CR>', opts)


-- Setting web dev icons options
vim.g.webdevicons_enable_nerdtree = 1
vim.g.webdevicons_enable_airline_tabline = 1
vim.g.webdevicons_enable_airline_statusline = 1
vim.g.webdevicons_enable_ctrlp = 1
vim.g.webdevicons_enable = 1

-- Custom extension symbols
vim.g.WebDevIconsUnicodeDecorateFileNodesExtensionSymbols = {
    js = '',
    ts = '',
}

-- Split and open definition vertically or horizontally
map('n', '<leader>ov', ':vsp<CR>:lua vim.fn.CocAction("jumpDefinition", "vsplit")<CR>', { silent = true, noremap = true })
map('n', '<leader>os', ':sp<CR>:lua vim.fn.CocAction("jumpDefinition", "split")<CR>', { silent = true, noremap = true })

-- Direct coc.nvim plug mappings
map('n', '<leader>oo', '<Plug>(coc-definition)', { silent = true })
map('n', '<leader>od', '<Plug>(coc-type-definition)', { silent = true })
map('n', '<leader>oi', '<Plug>(coc-implementation)', { silent = true })
map('n', '<leader>or', '<Plug>(coc-references)', { silent = true })

-- map('n', '<C-j>', 'copilot#Accept("\<CR>")', { silent = true, noremap = true })
map('n', '<leader>rn', '<Plug>(coc-rename)', { silent = true, noremap = true })
map('n', '<leader>qf', '<Plug>(coc-fix-current)', { silent = true, noremap = true })

-- map('i', '<S-Tab>', 'pumvisible() ? "\\<C-p>" : "\\<C-h>"', {expr = true, noremap = true})


-- Always show the signcolumn
vim.opt.signcolumn = "yes"

-- Enable termguicolors
vim.opt.termguicolors = true

-- Show documentation
function _G.show_documentation()
    local filetype = vim.bo.filetype
    if filetype == 'vim' or filetype == 'help' then
        vim.cmd('h ' .. vim.fn.expand('<cword>'))
    elseif vim.fn['coc#rpc#ready']() == 1 then
        vim.fn.CocActionAsync('doHover')
    else
        local keywordprg = vim.o.keywordprg
        vim.cmd('!' .. keywordprg .. ' ' .. vim.fn.expand('<cword>'))
    end
end

vim.api.nvim_set_keymap('n', 'K', ':lua _G.show_documentation()<CR>', {noremap = true, silent = true})

local myGroup = vim.api.nvim_create_augroup('MyGroup', { clear = true })

vim.api.nvim_create_autocmd('CursorHold', {
  pattern = '*',
  callback = function()
    vim.fn.CocActionAsync('highlight')
  end,
  group = myGroup,
})

vim.api.nvim_create_user_command('Format', function() vim.fn.CocAction('format') end, {})
vim.api.nvim_create_user_command('Fold', function() vim.fn.CocAction('fold', '') end, {nargs = '?'})
vim.api.nvim_create_user_command('OR', function() vim.fn.CocAction('runCommand', 'editor.action.organizeImport') end, {})

require('copilot').setup({
  panel = {
    enabled = true,
    auto_refresh = false,
    keymap = {
      jump_prev = "[[",
      jump_next = "]]",
      accept = "<CR>",
      refresh = "gr",
      open = "<M-CR>"
    },
    layout = {
      position = "bottom", -- | top | left | right
      ratio = 0.4
    },
  },
  suggestion = {
    enabled = true,
    auto_trigger = true,
    debounce = 75,
    keymap = {
      accept = "<C-l>",
      accept_word = false,
      accept_line = false,
      next = "<M-]>",
      prev = "<M-[>",
      dismiss = "<C-]>",
    },
  },
  filetypes = {
    yaml = false,
    markdown = false,
    help = false,
    gitcommit = false,
    gitrebase = false,
    hgcommit = false,
    svn = false,
    cvs = false,
    ["."] = false,
  },
  copilot_node_command = 'node', -- Node.js version must be > 18.x
  server_opts_overrides = {},
})

vim.cmd [[
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
]]

map('i', '<Tab>', "v:lua.tab_complete()", {expr = true, noremap = true, silent = true})

function _G.tab_complete()
    if vim.fn.pumvisible() == 1 then
        return "<C-n>"
    elseif _G.check_back_space() then
        return "<Tab>"
    else
        -- Directly calling a Vimscript function like coc#refresh() from Lua is tricky;
        -- you might need to use vim.cmd for Vimscript-specific functions or adjust this logic.
        return vim.fn["coc#refresh"]()
    end
end

function _G.check_back_space()
    local col = vim.fn.col('.') - 1
    if col == 0 then
        return true
    else
        local line = vim.fn.getline('.')
        -- Lua indexing starts at 1, so adjust accordingly
        local char_before_cursor = line:sub(col, col)
        return char_before_cursor:match('%s') ~= nil
    end
end

