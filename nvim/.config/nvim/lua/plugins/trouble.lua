return {
	"folke/trouble.nvim",

	config = function()
		require("trouble").setup({
			auto_open = false,
			auto_close = true,
			auto_preview = false,
			auto_fold = true,
			use_lsp_diagnostic_signs = true,
		})

		vim.keymap.set("n", "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>")
		vim.keymap.set("n", "<leader>xX", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>")

		vim.keymap.set("n", "<leader>xq", "<cmd>Trouble qflist toggle<cr>", { desc = "Quickfix List (Trouble)" })
	end,
}
