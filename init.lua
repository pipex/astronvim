local config = {
	colorscheme = "catppuccin",
	-- On/off virtual diagnostics text
	diagnostics = {
		virtual_text = true,
	},

	options = {
		opt = {
			relativenumber = true,
		},
	},

	polish = function()
		local opts = { noremap = true, silent = true }

		local map = vim.keymap.set
		local unmap = vim.keymap.del
		local tmap = function(shortcut, command)
			map("t", shortcut, command)
		end
		local noremap = function(mode, shortcut, command)
			map(mode, shortcut, command, { noremap = true })
		end
		-- No remap for all modes
		local _noremap = function(shortcut, command)
			map("", shortcut, command, { noremap = true })
		end

		-- Set key bindings
		map("n", "<C-s>", ":w!<CR>", opts)

		--  ; as :
		noremap("n", ";", ":")

		-- Use Ctrl+C to go back to normal mode (useful with ipad keyboard which does not have a esc key)
		_noremap("<C-c>", "<Esc>")

		-- Buffer nav with Tab
		noremap("n", "<Tab>", ":bn<CR>")
		noremap("n", "<S-Tab>", ":bp<CR>")

		-- terminal mappings

		-- disable some defaults first
		unmap("t", "<esc>")
		unmap("t", "jk")

		-- Redefine these mappings here as they don't take when defined on plugins
		map("n", "<C-h>", ":lua require'nvim-tmux-navigation'.NvimTmuxNavigateLeft()<cr>", opts)
		map("n", "<C-j>", ":lua require'nvim-tmux-navigation'.NvimTmuxNavigateDown()<cr>", opts)
		map("n", "<C-k>", ":lua require'nvim-tmux-navigation'.NvimTmuxNavigateUp()<cr>", opts)
		map("n", "<C-l>", ":lua require'nvim-tmux-navigation'.NvimTmuxNavigateRight()<cr>", opts)
		map("n", "<C-\\>", ":lua require'nvim-tmux-navigation'.NvimTmuxNavigateLastActive()<cr>", opts)
		map("n", "<C-Space>", ":lua require'nvim-tmux-navigation'.NvimTmuxNavigateNext()<cr>", opts)

		-- extra mappings for terminal navigaton
		tmap("<Leader><esc>", "<c-\\><c-n>")
		tmap("<Esc><esc>", "<c-\\><c-n>:ToggleTerm<CR>")
	end,
}

return config
