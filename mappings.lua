return {
	n = {
		--  ; as :
		[";"] = ":",
		-- Buffer nav with Tab
		["<Tab>"] = ":bn<CR>",
		["<S-Tab>"] = ":bp<CR>",
	},
	[""] = {
		-- Use Ctrl+C to go back to normal mode (useful with ipad keyboard which does not have a esc key)
		["<C-c>"] = "<Esc>",
	},
	t = {
		-- extra mappings for terminal navigaton
		["<Leader><esc>"] = "<c-\\><c-n>",
		["<Esc><esc>"] = "<c-\\><c-n>:ToggleTerm<CR>",
	},
}
