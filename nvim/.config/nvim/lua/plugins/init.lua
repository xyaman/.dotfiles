return {
  -- { "github/copilot.vim" },
  { "ray-x/go.nvim", dependencies = { "ray-x/guihua.lua" }, config = function() require("go").setup() end, event = { "CmdlineEnter" }, ft = { "go", "gomod" }, build = ':lua require("go.install").update_all_sync()' },
  { "NMAC427/guess-indent.nvim", opts = {} },
  "oky-123/marksign.vim",
}
