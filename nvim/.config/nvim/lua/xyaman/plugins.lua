return require('packer').startup(function()
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use 'nvim-lua/plenary.nvim' -- many plugins use this
  use 'nvim-lua/popup.nvim'

  use 'ThePrimeagen/vim-be-good'
  use 'ThePrimeagen/harpoon'

  -- theme
  use "gruvbox-community/gruvbox"

  -- Programming langs
  use 'decrement/logos.vim'
  use 'rust-lang/rust.vim'
  use 'ziglang/zig.vim'
  use 'ray-x/go.nvim'

  -- Telescope
  use 'nvim-telescope/telescope.nvim'

  use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}

  -- lsp config
  use 'neovim/nvim-lspconfig'
  -- use 'glepnir/lspsaga.nvim'
  use 'tami5/lspsaga.nvim'

  -- lsp completion
  use 'onsails/lspkind-nvim'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-nvim-lua'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/nvim-cmp'
  use 'L3MON4D3/LuaSnip'
  use 'saadparwaiz1/cmp_luasnip'
end)
