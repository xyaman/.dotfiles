return {
  "ellisonleao/gruvbox.nvim",
  -- { "catppuccin/nvim",               name = "catppuccin",                   priority = 1000 },
  -- { "github/copilot.vim" },
  { "ray-x/go.nvim", dependencies = { "ray-x/guihua.lua" }, config = function() require("go").setup() end, event = { "CmdlineEnter" }, ft = { "go", "gomod" }, build = ':lua require("go.install").update_all_sync()' },
  "lewis6991/gitsigns.nvim",
  {
    'stevearc/oil.nvim',
    opts = {},
    dependencies = { { "echasnovski/mini.icons", opts = {} } },
  },
}
