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

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins-setup.lua source <afile> | PackerSync
  augroup end
]])

local status, packer = pcall(require, 'packer')
if not status then
  return
end

return packer.startup(function(use)
  --Packer can manage itself
  use { "wbthomason/packer.nvim" }
  
  -- necessary lua functions
  use { "nvim-lua/plenary.nvim" }

  -- Color schemes
  use { "catppuccin/nvim", as = "catppuccin" }
  use { "sainnhe/sonokai" }
  use { "bluz71/vim-nightfly-guicolors" }
  use { "EdenEast/nightfox.nvim" }
  use { "navarasu/onedark.nvim" }
  use { "rmehri01/onenord.nvim", branch = "main" }

  -- LSP
  use { 
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v2.x',
    requires = {
      -- LSP Support
      {'neovim/nvim-lspconfig'},             -- Required
      {                                      -- Optional
        'williamboman/mason.nvim',
        run = function()
          pcall(vim.cmd, 'MasonUpdate')
        end,
      },
      {'williamboman/mason-lspconfig.nvim'}, -- Optional

      -- Autocompletion
      {'hrsh7th/nvim-cmp'},     -- Required
      {'hrsh7th/cmp-nvim-lsp'}, -- Required
      {'L3MON4D3/LuaSnip'},     -- Required
    }
  }

  -- File navigation
  use {
    "nvim-telescope/telescope.nvim", tag = "0.1.1",
    requires = { {'nvim-lua/plenary.nvim'} }
  }
  use { "nvim-telescope/telescope-fzf-native.nvim", run = "make" }
  use { "nvim-tree/nvim-tree.lua" }

  -- treesitter
  use { 
    "nvim-treesitter/nvim-treesitter",
    run = function()
      require("nvim-treesitter.install").update({ with_sync = true })
    end,
  }

  -- auto closing
  use { "windwp/nvim-autopairs" }
  use { "windwp/nvim-ts-autotag" }

  -- git
  use { "lewis6991/gitsigns.nvim" }

  -- Other
  use { "ThePrimeagen/vim-be-good" } -- vim tutorial
  use { "tpope/vim-surround" } -- surround text with characters
  use { "kyazdani42/nvim-web-devicons" } -- icons
  use { "nvim-lualine/lualine.nvim" } -- status line

  if packer_bootstrap then
    require('packer').sync()
  end
end)
