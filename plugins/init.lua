return {
	["declancm/cinnamon.nvim"] = { disable = true },
	["nvim-neo-tree/neo-tree.nvim"] = { disable = true },
	["mrjones2014/smart-splits.nvim"] = { disable = true },
	["andymass/vim-matchup"] = {},
	["catppuccin/nvim"] = {
		as = "catppuccin",
		config = function()
			require("catppuccin").setup({
				transparent_background = false,
				term_colors = false,
				styles = {
					comments = "italic",
					functions = "italic",
					keywords = "italic",
					strings = "NONE",
					variables = "italic",
				},
				integrations = {
					treesitter = true,
					native_lsp = {
						enabled = true,
						virtual_text = {
							errors = "italic",
							hints = "italic",
							warnings = "italic",
							information = "italic",
						},
						underlines = {
							errors = "underline",
							hints = "underline",
							warnings = "underline",
							information = "underline",
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
	["alexghergh/nvim-tmux-navigation"] = {
		config = function()
			-- Remove smart-splits mappings
			require("nvim-tmux-navigation").setup({
				disable_when_zoomed = true, -- defaults to false
				keybindings = {
					left = "<C-h>",
					down = "<C-j>",
					up = "<C-k>",
					right = "<C-l>",
					last_active = "<C-\\>",
					next = "<C-Space>",
				},
			})
		end,
	},
	["dhruvasagar/vim-table-mode"] = {
		cmd = "TableModeToggle",
		config = function()
			vim.g.table_mode_corner = "|"
		end,
	},
	["mfussenegger/nvim-dap"] = {
		module = "dap",
		config = require("user.plugins.dap"),
	},
	["rcarriga/nvim-dap-ui"] = {
		after = "nvim-dap",
		config = function()
			local dap, dapui = require("dap"), require("dapui")
			dapui.setup(require("user.plugins.dapui"))
			-- add listeners to auto open DAP UI
			dap.listeners.after.event_initialized["dapui_config"] = function()
				dapui.open()
			end
			dap.listeners.before.event_terminated["dapui_config"] = function()
				dapui.close()
			end
			dap.listeners.before.event_exited["dapui_config"] = function()
				dapui.close()
			end
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
			vim.g.vim_markdown_conceal = 1
			vim.g.vim_markdown_conceal_code_blocks = 0
			vim.opt.conceallevel = 2
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
}
