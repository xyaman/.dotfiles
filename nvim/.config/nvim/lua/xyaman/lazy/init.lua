return {
  { 'nvim-telescope/telescope.nvim', tag = '0.1.6',                         dependencies = { 'nvim-lua/plenary.nvim' } },
  { "catppuccin/nvim",               name = "catppuccin",                   priority = 1000 },
  -- { "github/copilot.vim" },
  { "ray-x/go.nvim",                 dependencies = { "ray-x/guihua.lua" }, config = function() require("go").setup() end, event = { "CmdlineEnter" }, ft = { "go", "gomod" }, build = ':lua require("go.install").update_all_sync()' },
  "tpope/vim-fugitive",
}
