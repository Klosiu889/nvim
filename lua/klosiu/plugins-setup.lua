local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
   "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  -- necessary lua functions
  { 'nvim-lua/plenary.nvim' },

  -- Color schemes
  { 'catppuccin/nvim', name = 'catppuccin', priority = 1000 },
  { 'sainnhe/sonokai' },
  { 'bluz71/vim-nightfly-guicolors' },
  { 'EdenEast/nightfox.nvim' },
  { 'navarasu/onedark.nvim' },
  { 'rmehri01/onenord.nvim', branch = 'main' },

  -- LSP
  { 'williamboman/mason.nvim' },
  { 'williamboman/mason-lspconfig.nvim' },
  { 'VonHeikemen/lsp-zero.nvim', branch = 'v3.x' },
  { 'neovim/nvim-lspconfig' },
  { 'hrsh7th/cmp-nvim-lsp' },
  { 'hrsh7th/nvim-cmp' },
  { 'L3MON4D3/LuaSnip' },

  -- File navigation
  {
    'nvim-telescope/telescope.nvim', tag = '0.1.1',
    dependencies = { {'nvim-lua/plenary.nvim'} }
  },
  { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
  { 'nvim-tree/nvim-tree.lua' },

  -- treesitter
  {
    'nvim-treesitter/nvim-treesitter',
    build = function()
      require('nvim-treesitter.install').update({ with_sync = true })
    end,
  },

  { 'github/copilot.vim' },

  -- auto closing
  { 'windwp/nvim-autopairs' },
  { 'windwp/nvim-ts-autotag' },

  -- git
  { 'lewis6991/gitsigns.nvim' },

  -- window management
  { 'christoomey/vim-tmux-navigator' }, -- switching between windows
  { 'szw/vim-maximizer' }, -- maximizes and restores current window

  -- nvChad
  { 'NvChad/nvterm' },

  -- Other
  { 'ThePrimeagen/vim-be-good' }, -- vim tutorial
  { 'tpope/vim-surround' }, -- surround text with characters
  { 'kyazdani42/nvim-web-devicons' }, -- icons
  { 'nvim-lualine/lualine.nvim' }, -- status line
  { 'vim-scripts/ReplaceWithRegister' }, -- replace text with register
  { 'numToStr/Comment.nvim' }, -- commenting code fragment
})
