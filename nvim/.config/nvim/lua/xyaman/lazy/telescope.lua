return {
  "nvim-telescope/telescope.nvim",
  tag = "0.1.6",

  dependencies = { "nvim-lua/plenary.nvim", "nvim-tree/nvim-web-devicons" },

  config = function()
    require("telescope").setup {
      defaults = {
        file_ignore_patterns = { "node_modules", "^zig-cache/", ".git\\" },
      },
    }

    local builtin = require("telescope.builtin")
    vim.keymap.set("n", "<leader>t", builtin.find_files)
    vim.keymap.set("n", "<leader>gr", builtin.live_grep)
  end
}
