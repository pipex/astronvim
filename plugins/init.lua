return {
	["nvim-neo-tree/neo-tree.nvim"] = { disable = true },
	["mrjones2014/smart-splits.nvim"] = {
		config = function()
			require("smart-splits").setup({
				tmux_integration = true,
			})
		end,
	},
	["andymass/vim-matchup"] = {},
	["catppuccin/nvim"] = {
		as = "catppuccin",
		config = function()
			require("catppuccin").setup({
				transparent_background = true,
				term_colors = false,
				styles = {
					comments = { "italic" },
					functions = { "italic" },
					keywords = { "italic" },
					strings = {},
					variables = { "italic" },
				},
				integrations = {
					treesitter = true,
					native_lsp = {
						enabled = true,
						virtual_text = {
							errors = { "italic" },
							hints = { "italic" },
							warnings = { "italic" },
							information = { "italic" },
						},
						underlines = {
							errors = { "underline" },
							hints = { "underline" },
							warnings = { "underline" },
							information = { "underline" },
						},
					},
					lsp_trouble = false,
					cmp = true,
					lsp_saga = true,
					gitgutter = false,
					gitsigns = true,
					telescope = true,
					nvimtree = {
						enabled = true,
						show_root = false,
						transparent_panel = false,
					},
					neotree = {
						enabled = false,
						show_root = true,
						transparent_panel = true,
					},
					which_key = true,
					indent_blankline = {
						enabled = true,
						colored_indent_levels = false,
					},
					dashboard = false,
					neogit = true,
					vim_sneak = false,
					fern = false,
					barbar = false,
					bufferline = true,
					markdown = true,
					lightspeed = false,
					ts_rainbow = true,
					hop = true,
					notify = false,
				},
			})
		end,
	},
	["ethanholz/nvim-lastplace"] = {
		config = function()
			require("nvim-lastplace").setup(require("user.plugins.nvim-lastplace"))
		end,
	},
	["dhruvasagar/vim-table-mode"] = {
		cmd = "TableModeToggle",
		config = function()
			vim.g.table_mode_corner = "|"
		end,
	},
	["mickael-menu/zk-nvim"] = {
		module = { "zk", "zk.commands" },
		config = function()
			require("zk").setup(require("user.plugins.zk"))
		end,
	},
	["vitalk/vim-simple-todo"] = {
		config = function()
			vim.g.simple_todo_map_keys = false
		end,
	},
	["preservim/vim-markdown"] = {
		config = function()
			vim.g.vim_markdown_auto_insert_bullets = false
			vim.g.vim_markdown_new_list_item_indent = 0
			vim.g.vim_markdown_folding_disabled = 1
		end,
	},
	["danymat/neogen"] = {
		module = "neogen",
		cmd = "Neogen",
		config = function()
			require("neogen").setup(require("user.plugins.neogen"))
		end,
		requires = "nvim-treesitter/nvim-treesitter",
	},
	["ruifm/gitlinker.nvim"] = {
		config = function()
			require("gitlinker").setup({
				opts = {
					-- action_callback = require("gitlinker.actions").open_in_browser,
					-- print_url = false,
				},
			})
		end,
		requires = "nvim-lua/plenary.nvim",
	},
	["vito-c/jq.vim"] = {},
	["gpanders/editorconfig.nvim"] = {},
	["zbirenbaum/copilot.lua"] = {
		event = "VimEnter",
		config = function()
			vim.defer_fn(function()
				require("copilot").setup({
					suggestion = {
						enabled = true,
						auto_trigger = true,
						debounce = 1000,
						keymap = {
							next = "<C-]>",
							dismiss = "<C-\\>",
						},
					},
				})
			end, 100)
		end,
	},
	["ojroques/vim-oscyank"] = {
		config = function()
			vim.cmd(
				[[autocmd TextYankPost * if v:event.operator is 'y' && v:event.regname is '' | execute 'OSCYankReg "' | endif]]
			)
			vim.g.oscyank_term = "default"
		end,
	},
}
