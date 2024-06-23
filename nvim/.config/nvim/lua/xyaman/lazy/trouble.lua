return {
  "folke/trouble.nvim",

  config = function()
    require("trouble").setup {
      auto_open = false,
      auto_close = true,
      auto_preview = true,
      auto_fold = true,
      use_lsp_diagnostic_signs = true,
    }

    vim.keymap.set("n", "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>")
    vim.keymap.set("n", "<leader>xX", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>")
  end,
}
