local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
        vim.cmd [[packadd packer.nvim]]
        return true
    end
    return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'
    use 'nvim-lua/plenary.nvim'

    use 'kylechui/nvim-surround'
    use 'windwp/nvim-autopairs'

    -- Treesitter
    use({'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'})

    use('theprimeagen/harpoon')
    use('mbbill/undotree')

    -- LSP Autocomplete
    use 'neovim/nvim-lspconfig'
    use 'hrsh7th/nvim-cmp'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'L3MON4D3/LuaSnip'
    use 'saadparwaiz1/cmp_luasnip'

    -- Mason
    use 'williamboman/mason.nvim'
    use 'williamboman/mason-lspconfig.nvim'

    use {
        'phaazon/hop.nvim',
        branch = 'v2',
        config = function()
            -- :h hop-config
            require 'hop'.setup { keys = 'etovxqpdygfblzhckisuran' }
        end
    }

    use 'lukas-reineke/indent-blankline.nvim'

    use 'tpope/vim-fugitive'

    -- Grammar check
    use 'rhysd/vim-grammarous'

    -- Themes
    use { "catppuccin/nvim", as = "catppuccin" }

    -- TeleScope
    use {'nvim-telescope/telescope.nvim'}
    use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }

    -- file explorer
    use { "nvim-telescope/telescope-file-browser.nvim" }

    -- if I want to do any plugin install playground
    -- use('nvim-treesitter/playground')

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if packer_bootstrap then
        require('packer').sync()
    end
end)
