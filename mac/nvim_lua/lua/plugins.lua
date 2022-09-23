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

-- Use a protected call so we don"t error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
    print("Packer is not installed")
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

packer.startup(function(use)
    -- packer can manage itself!
    use "wbthomason/packer.nvim"

    -- nvim-tree file explorer
    use {
        "kyazdani42/nvim-tree.lua",
        requires = { "kyazdani42/nvim-web-devicons" }
    }

    -- lsp config
    use { "neovim/nvim-lspconfig", tag = "v0.1.3" }

    -- dap
    use "simrat39/rust-tools.nvim"
    -- use "nyinyithann/rust-tools.nvim"
    use { "mfussenegger/nvim-dap" }
    use { "rcarriga/nvim-dap-ui", requires = { "mfussenegger/nvim-dap" } }

    -- nightfox color scheme
    use "EdenEast/nightfox.nvim"
    use "sainnhe/gruvbox-material"
    use "folke/tokyonight.nvim"
    use "rktjmp/lush.nvim"
    use "ellisonleao/gruvbox.nvim"
    use "savq/melange"
    use "meliora-theme/neovim"
    use "adisen99/codeschool.nvim"
    use "folke/lsp-colors.nvim"
    use "https://gitlab.com/yorickpeterse/vim-paper.git"
    use { "catppuccin/nvim", as = "catppuccin" }
    use 'navarasu/onedark.nvim'

    -- autocompletion
    use "hrsh7th/nvim-cmp"
    use "hrsh7th/cmp-nvim-lsp"
    use "hrsh7th/cmp-buffer"
    use "hrsh7th/cmp-nvim-lsp-signature-help"
    use "hrsh7th/cmp-path"
    use "hrsh7th/cmp-nvim-lua"
    use "saadparwaiz1/cmp_luasnip"
    use "rafamadriz/friendly-snippets"

    -- snippet
    use "L3MON4D3/LuaSnip"

    -- symbol
    use "simrat39/symbols-outline.nvim"

    -- statusbar
    use {
        "nvim-lualine/lualine.nvim",
        requires = { "kyazdani42/nvim-web-devicons", opt = true }
    }

    -- bufferline
    use { "akinsho/nvim-bufferline.lua", tag = "v2.7.0" }

    -- commenting
    use {
        "numToStr/Comment.nvim",
        config = function()
            require("Comment").setup()
        end
    }

    -- treesitter
    use {
        "nvim-treesitter/nvim-treesitter",
        run = function() require("nvim-treesitter.install").update({ with_sync = true }) end,
    }

    -- terminal
    use { "akinsho/toggleterm.nvim", tag = "v2.*" }

    -- telescope
    use {
        "nvim-telescope/telescope.nvim", tag = "0.1.0",
        requires = { { "nvim-lua/plenary.nvim" } }
    }
    use { "nvim-telescope/telescope-fzf-native.nvim", run = "make" }
    use "xiyaowong/telescope-emoji.nvim"
    use "dhruvmanila/telescope-bookmarks.nvim"
    use "LinArcX/telescope-command-palette.nvim"
    use "nvim-telescope/telescope-file-browser.nvim"
    use "nvim-telescope/telescope-dap.nvim"

    -- highlight
    use "RRethy/vim-illuminate"

    -- indentation guides
    use "lukas-reineke/indent-blankline.nvim"

    -- window navigation
    use "https://gitlab.com/yorickpeterse/nvim-window.git"

    -- autopairs
    use "windwp/nvim-autopairs"

    -- luapad
    use { "rafcamlet/nvim-luapad", requires = "antoinemadec/FixCursorHold.nvim" }

    -- better escape
    use "max397574/better-escape.nvim"

    use "jose-elias-alvarez/null-ls.nvim" -- Use Neovim as a language server to inject LSP diagnostics, code actions, and more via Lua

    -- tmux integration
    use "aserowy/tmux.nvim"

    -- markdown
    use({
        "iamcco/markdown-preview.nvim",
        run = function() vim.fn["mkdp#util#install"]() end,
    })

    -- git
    use "lewis6991/gitsigns.nvim"

    -- rescript
    use "rescript-lang/vim-rescript"

    -- hop
    use {
        'phaazon/hop.nvim',
        branch = 'v2'
    }

    use { "nyinyithann/toggle-lsp-diagnostics.nvim" }
    -- autosave
    -- use({
    --     "Pocco81/auto-save.nvim",
    --     config = function()
    --         require("auto-save").setup {}
    --     end,
    -- })

    -- Automatically run packer.clean() followed by packer.update() after cloning packer.nvim
    -- Put this at the end after all plugins
    if PACKER_BOOTSTRAP then
        require("packer").sync()
    end
end)
