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

		-- extra mappings for terminal navigaton
		tmap("<Leader><esc>", "<c-\\><c-n>")
		tmap("<Esc><esc>", "<c-\\><c-n>:ToggleTerm<CR>")
		tmap("<c-h>", "<c-\\><c-n><c-w>h")
		tmap("<c-j>", "<c-\\><c-n><c-w>j")
		tmap("<c-k>", "<c-\\><c-n><c-w>k")
		tmap("<c-l>", "<c-\\><c-n><c-w>l")
	end,
}

return config
