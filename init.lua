local config = {
	colorscheme = "catppuccin",

	mappings = {
		n = {
			--  ; as :
			[";"] = ":",
			-- Buffer nav with Tab
			["<Tab>"] = ":bn<CR>",
			["<S-Tab>"] = ":bp<CR>",
			-- Redefine these mappings here as they don't take when defined on plugins
			["<C-h>"] = ":lua require'nvim-tmux-navigation'.NvimTmuxNavigateLeft()<cr>",
			["<C-j>"] = ":lua require'nvim-tmux-navigation'.NvimTmuxNavigateDown()<cr>",
			["<C-k>"] = ":lua require'nvim-tmux-navigation'.NvimTmuxNavigateUp()<cr>",
			["<C-l>"] = ":lua require'nvim-tmux-navigation'.NvimTmuxNavigateRight()<cr>",
			["<C-\\>"] = ":lua require'nvim-tmux-navigation'.NvimTmuxNavigateLastActive()<cr>",
			["<C-Space>"] = ":lua require'nvim-tmux-navigation'.NvimTmuxNavigateNext()<cr>",
		},
		[""] = {
			-- Use Ctrl+C to go back to normal mode (useful with ipad keyboard which does not have a esc key)
			["<C-c>"] = "<Esc>",
		},
		t = {
			-- disable some defaults first
			jk = false,
			["<esc>"] = false,
			-- extra mappings for terminal navigaton
			["<Leader><esc>"] = "<c-\\><c-n>",
			["<Esc><esc>"] = "<c-\\><c-n>:ToggleTerm<CR>",
		},
	},
}

return config
