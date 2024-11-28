return {
	"stevearc/conform.nvim",
	opts = {},

	config = function()
		require("conform").setup({
			formatters_by_ft = {
				lua = { "stylua" },
				javascript = { "prettierd", "prettier", stop_after_first = true },
				typescript = { "prettierd", "prettier", stop_after_first = true },
				html = { "prettierd", "prettier", stop_after_first = true },
			},
		})

		vim.keymap.set("n", "<leader>lf", require("conform").format)
	end,
}
