return require('packer').startup(function()
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  use 'nvim-lua/plenary.nvim' -- many plugins use this
  use 'nvim-lua/popup.nvim'

  use 'ThePrimeagen/vim-be-good'
  use 'ThePrimeagen/harpoon'

  -- theme
  use {"ellisonleao/gruvbox.nvim", requires = {"rktjmp/lush.nvim"}} -- Gruvbox
  use "EdenEast/nightfox.nvim"

  -- logos syntax (tweaks dev)
  use 'decrement/logos.vim'

  -- Programming langs
  use 'rust-lang/rust.vim'
  use 'ziglang/zig.vim'

  -- Telescope
  use 'nvim-telescope/telescope.nvim'

  use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}

  -- lsp config
  use 'neovim/nvim-lspconfig'

  -- lsp completion
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-nvim-lua'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/nvim-cmp'
  use 'L3MON4D3/LuaSnip'
  use 'saadparwaiz1/cmp_luasnip'
end)
