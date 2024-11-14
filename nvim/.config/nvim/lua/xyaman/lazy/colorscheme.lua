return {
  {
    "ellisonleao/gruvbox.nvim",

    config = function()
      require("gruvbox").setup({
        transparent_mode = true,
      })
    end
  },
  {
    "rose-pine/neovim",
    name = "rose-pine",
    config = function()
      require('rose-pine').setup({
        disable_background = true,
        styles = {
          italic = false,
        },
      })
    end
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
  },
}
