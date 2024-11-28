return {
  'stevearc/oil.nvim',

  dependencies = { "echasnovski/mini.icons" },

  config = function()
    require("oil").setup({
      use_default_keymaps = false,
      keymaps = {
        ["g?"] = "actions.show_help",
        ["<CR>"] = "actions.select",
        ["gs"] = "actions.change_sort",
        ["g."] = "actions.toggle_hidden",
        ["<C-c>"] = "actions.close",
        ["-"] = "actions.parent",
        ["`"] = "actions.cd",
        ["_"] = "actions.open_cwd",

        -- ["<C-s>"] = { "actions.select", opts = { vertical = true }, desc = "Open the entry in a vertical split" },
        -- ["<C-h>"] = { "actions.select", opts = { horizontal = true }, desc = "Open the entry in a horizontal split" },
        -- ["<C-t>"] = { "actions.select", opts = { tab = true }, desc = "Open the entry in new tab" },
        -- ["<C-p>"] = "actions.preview",
        -- ["<C-l>"] = "actions.refresh",
        -- ["~"] = { "actions.cd", opts = { scope = "tab" }, desc = ":tcd to the current oil directory", mode = "n" },
        -- ["gx"] = "actions.open_external",
      },
    })
  end
}
