local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer close and reopen Neovim...")
	vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- Have packer use a popup window
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

-- Install your plugins here
return packer.startup(function(use)
	use ("wbthomason/packer.nvim") -- Have packer manage itself	

	-- Themes
        use 'sonph/onehalf'
        use 'morhetz/gruvbox'
        
        -- Plugins
        use {'vim-test/vim-test'}
        use {'tpope/vim-projectionist'}
        use {'corntrace/bufexplorer'}
        use {'preservim/nerdtree'}
        use {'preservim/nerdcommenter'}
        
        use { 'junegunn/fzf', 
            dir = '~/.fzf', -- Specify custom install directory for fzf if necessary
            run = './install --all' -- Run the install script after cloning
        }
        use { 'mhinz/vim-grepper', 
            opts = {
                -- Define lazy-loading triggers
                on = { 'Grepper', '<plug>(GrepperOperator)' }
            }
        }

        use {'tpope/vim-fugitive'}
        use {'ryanoasis/vim-devicons'}

        use {'neoclide/coc.nvim', branch = 'release'}
        -- use 'OmniSharp/omnisharp-vim'
        -- use {'github/copilot.vim'}
        use { "zbirenbaum/copilot.lua" }

	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
