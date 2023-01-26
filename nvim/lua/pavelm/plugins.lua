local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don"t error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  auto_clean = true,
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

-- Install your plugins here
return packer.startup(function(use)
  -- My plugins here
  use "wbthomason/packer.nvim" -- Have packer manage itself

  use {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v1.x',
    requires = {
      -- LSP Support
      {'neovim/nvim-lspconfig'},             -- Required
      {'williamboman/mason.nvim'},           -- Optional
      {'williamboman/mason-lspconfig.nvim'}, -- Optional

      -- Autocompletion
      {'hrsh7th/nvim-cmp'},         -- Required
      {'hrsh7th/cmp-nvim-lsp'},     -- Required
      {'hrsh7th/cmp-buffer'},       -- Optional
      {'hrsh7th/cmp-path'},         -- Optional
      {'saadparwaiz1/cmp_luasnip'}, -- Optional
      {'hrsh7th/cmp-nvim-lua'},     -- Optional

      -- Snippets
      {'L3MON4D3/LuaSnip'},             -- Required
      {'rafamadriz/friendly-snippets'}, -- Optional
    }
  }

--  use { -- LSP Configuration & Plugins
--    'neovim/nvim-lspconfig',
--    requires = {
--      -- Automatically install LSPs to stdpath for neovim
--      'williamboman/mason.nvim',
--      'williamboman/mason-lspconfig.nvim',
--
--      -- Useful status updates for LSP
--      'j-hui/fidget.nvim',
--
--      -- Additional lua configuration, makes nvim stuff amazing
--      'folke/neodev.nvim',
--    },
--  }
  -- Git related plugins
  use 'tpope/vim-fugitive'
  use 'tpope/vim-rhubarb'
  use 'lewis6991/gitsigns.nvim'

  use "nvim-lua/popup.nvim" -- An implementation of the Popup API from vim in Neovim
  use "nvim-lua/plenary.nvim" -- Useful lua functions used ny lots of plugins
  use "nvim-lualine/lualine.nvim"
  use 'lukas-reineke/indent-blankline.nvim' -- Add indentation guides even on blank lines
  --use "morhetz/gruvbox"
  use 'folke/tokyonight.nvim'
  use "nvim-telescope/telescope.nvim"
  use "fatih/vim-go"
  use "hashivim/vim-terraform"
  -- cmp plugins
--  use "hrsh7th/nvim-cmp" -- The completion plugin
--  use "hrsh7th/cmp-buffer" -- buffer completions
--  use "hrsh7th/cmp-path" -- path completions
--  use "hrsh7th/cmp-cmdline" -- cmdline completions
--  use "saadparwaiz1/cmp_luasnip" -- snippet completions
--  use "hrsh7th/cmp-nvim-lsp"

  use "glepnir/lspsaga.nvim"

  -- Snippets
--  use "L3MON4D3/LuaSnip"
--  use "rafamadriz/friendly-snippets"

  -- Treesitter
  use {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
  }
  use {
    "folke/which-key.nvim",
    config = function()
      require("which-key").setup {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      }
    end
  }
  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)

