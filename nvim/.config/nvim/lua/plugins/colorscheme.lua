return {
	{
		"vague2k/vague.nvim",
		config = function()
			require("vague").setup({
				transparent = true,
			})
		end,
	},
	{
		"ellisonleao/gruvbox.nvim",
		config = function()
			require("gruvbox").setup({
				transparent_mode = true,
			})
		end,
	},
	{
		"rose-pine/neovim",
		name = "rose-pine",
		config = function()
			require("rose-pine").setup({
				disable_background = true,
				styles = {
					italic = false,
				},
			})
		end,
	},
	{
		"catppuccin/nvim",
		name = "catppuccin",
	},
	{
		"folke/tokyonight.nvim",
		config = function()
			require("tokyonight").setup({
				transparent = true, -- Enable this to disable setting the background color
				style = "night",
				styles = {
					functions = {},
				},
			})
		end,
	},
}
