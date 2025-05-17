return {
  -- { "github/copilot.vim" },
  -- { "NMAC427/guess-indent.nvim", opts = {} },
  { "ray-x/go.nvim", dependencies = { "ray-x/guihua.lua" }, config = function() require("go").setup() end, event = { "CmdlineEnter" }, ft = { "go", "gomod" }, build = ':lua require("go.install").update_all_sync()' },
}
