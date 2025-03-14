return {
	"nvim-treesitter/nvim-treesitter",

	dependencies = {
		{
			"nvim-treesitter/nvim-treesitter-context",
			opts = {
				enabled = true,
				-- Avoid the sticky context from growing a lot.
				max_lines = 3,
				-- Match the context lines to the source code.
				multiline_threshold = 1,
				-- Disable it when the window is too small.
				min_window_height = 20,
			},
			keys = {
				{
					"[c",
					function()
						-- Jump to previous change when in diffview.
						if vim.wo.diff then
							return "[c"
						else
							vim.schedule(function()
								require("treesitter-context").go_to_context()
							end)
							return "<Ignore>"
						end
					end,
					desc = "Jump to upper context",
					expr = true,
				},
			},
		},
	},

	build = ":TSUpdate",
	opts = {
		ensure_installed = {},

		-- Install languages synchronously (only applied to `ensure_installed`)
		sync_install = false,

		-- List of parsers to ignore installing
		ignore_install = { "" },

		-- Automatically install missing parsers when entering buffer
		-- Recommendation: set to false if you don"t have `tree-sitter` CLI installed locally
		auto_install = true,

		autopairs = {
			enable = true,
		},

		indent = {
			enable = true,
		},

		highlight = {
			-- `false` will disable the whole extension
			enable = true,

			-- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
			-- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
			-- the name of the parser)
			-- list of language that will be disabled
			disable = function(_, bufnr)
				-- neovim get size of buffer
				local file_size = vim.fn.getfsize(vim.fn.bufname(bufnr))
				local file_lines = vim.api.nvim_buf_line_count(bufnr)
				print("file size:", file_size, "(bytes)")
				return file_size > 50000 or file_lines > 50000
			end,

			-- Setting this to true will run `:h syntax` and tree-sitter at the same time.
			-- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
			-- Using this option may slow down your editor, and you may see some duplicate highlights.
			-- Instead of true it can also be a list of languages
			additional_vim_regex_highlighting = false,
		},

		context_commentstring = {
			enable = true,
			enable_autocmd = false,
		},
	},

	config = function(_, opts)
		require("nvim-treesitter.configs").setup(opts)
	end,
}
