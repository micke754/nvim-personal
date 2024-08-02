return {
	"stevearc/conform.nvim",
	event = { "BufWritePre" },
	cmd = { "ConformInfo" },
	keys = {
		{
			-- Customize or remove this keymap to your liking
			"<leader>ff",
			function()
				require("conform").format({ async = true })
			end,
			mode = "",
			desc = "Format buffer",
		},
	},
	-- This will provide type hinting with LuaLS
	---@module "conform"
	---@type conform.setupOpts
	opts = {
		-- Define your formatters
		formatters_by_ft = {
			lua = { "stylua" },
			-- python = { "isort", "black" },
			r = { lsp_format = "prefer" },
			sql = { "sqlfmt", lsp_format = "never" },
			plsql = { "sqlfmt", lsp_format = "never" },
			-- javascript = { "prettierd", "prettier", stop_after_first = true },
		},
		-- Set default options
		default_format_opts = {
			lsp_format = "fallback",
		},
		-- Set up format-on-save
		format_on_save = {
			-- timeout_ms = 500
		},

		-- Managing Errors
		notify_on_error = false,
		notify_no_formatters = true,

		-- Customize formatters
		formatters = {
			shfmt = {
				prepend_args = { "-i", "2" },
			},
			sqlfmt = {
				append_args = { "-l 80" },
			},
			sqlfluff = {
				append_args = { "--dialect", "oracle" },
			},
		},
	},
	init = function()
		-- If you want the formatexpr, here is the place to set it
		vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
	end,
}
